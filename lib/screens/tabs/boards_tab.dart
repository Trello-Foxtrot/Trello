import 'package:flutter/material.dart';
import 'package:trello/buttons/add_button.dart';
import 'package:trello/buttons/board_button.dart';
import 'package:trello/popups/create_board_popup.dart';
import 'package:http/http.dart' as http;
import 'package:trello/globals.dart' as globals;

class BoardsTab extends StatefulWidget {
  @override
  _BoardsTabState createState() => _BoardsTabState();
}

class _BoardsTabState extends State<BoardsTab> {
  List<String> boardsList = [];

  _BoardsTabState() {
    updateBoardsLists();
  }

  void updateBoardsLists() {
    Map<String, dynamic> map = new Map<String, dynamic>();
    map['id'] = globals.CurrentWorkspace.id.toString();

    http.post(
        Uri.parse('http://localhost:8000/trello/workspace/boards'),
        body: map,
    ).then((response) {
      Map<String, dynamic> map = response.headers;
      setState(() {
        boardsList = map['boards']?.split(',') ?? [];
        boardsList.removeLast();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 30,
              runSpacing: 40,
              children: boardsList.isEmpty
                  ? List.generate(
                      1,
                      (index) => AddButton(
                            onClick: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CreateBoardDialog();
                                  });
                            },
                          ))
                  : List.generate(boardsList.length + 1, (index) {
                      if (index < boardsList.length) {
                        return BoardButton(
                          text: boardsList[index],
                          onClick: () {},
                        );
                      } else {
                        return AddButton(
                          onClick: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return CreateBoardDialog();
                                });
                          },
                        );
                      }
                    }),
            ),
          ],
        ),
      ),
    );
  }
}
