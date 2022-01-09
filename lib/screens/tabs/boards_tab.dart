import 'dart:html';

import 'package:flutter/material.dart';
import 'package:trello/buttons/add_button.dart';
import 'package:trello/buttons/board_button.dart';
import 'package:trello/globals.dart' as globals;
import 'package:trello/popups/board%20popups/create_board_popup.dart';
import 'package:trello/screens/board_screen.dart';

class BoardsTab extends StatefulWidget {
  @override
  _BoardsTabState createState() => _BoardsTabState();
}

class _BoardsTabState extends State<BoardsTab> {
  List<String> boardsList = [];
  List<String> boardsIdList = [];

  _BoardsTabState() {
    updateBoards();
  }

  void updateBoards() {
    Map<String, String> map = <String, String>{};
    map['workspace_id'] = globals.CurrentWorkspace.id.toString();

    globals.Session.post(
        'trello/workspace/boards',
        map,
    ).then((resMap) {
      setState(() {
        boardsList = resMap['boards'].cast<String>();
        boardsIdList = resMap['boards_id'].cast<String>();
      });
    });
  }

  void goToBoard() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => BoardScreen()),
    ).then((value) => {
        if(value==false)
          goToBoard()
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
                                  }).whenComplete(() => updateBoards());
                            },
                          ))
                  : List.generate(boardsList.length + 1, (index) {
                      if (index < boardsList.length) {
                        return BoardButton(
                          text: boardsList[index],
                          onClick: () {
                            globals.CurrentBoard.id = int.parse(boardsIdList[index]);
                            globals.CurrentBoard.title = boardsList[index];

                            goToBoard();
                          },
                        );
                      } else {
                        return AddButton(
                          onClick: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return CreateBoardDialog();
                                }).whenComplete(() => updateBoards());
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
