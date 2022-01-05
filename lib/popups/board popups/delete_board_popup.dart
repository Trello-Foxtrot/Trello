import 'package:flutter/material.dart';
import 'package:trello/buttons/blue_button.dart';
import 'package:trello/buttons/cancel_button.dart';
import 'package:trello/screens/main_screen.dart';
import 'package:http/http.dart' as http;
import 'package:trello/globals.dart' as globals;
import 'package:trello/screens/workspace_screen.dart';

class DeleteBoardDialog extends StatelessWidget {

  Future<dynamic> deleteBoard() {
    Map<String, String> map = new Map<String, String>();
    map['board_id'] = globals.CurrentBoard.id.toString();

    return globals.Session.post(
      'trello/workspace/boards/delete',
      map,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: 400,
        height: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Text(
                    "Are you sure you want to delete the Board?",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CancelButton(
                      onClick: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    DialogBlueButton(
                      text: "Delete",
                      onClick: () {
                        deleteBoard().then((value) => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => WorkspaceScreen()),
                          )
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
