import 'package:flutter/material.dart';
import 'package:trello/buttons/blue_button.dart';
import 'package:trello/buttons/cancel_button.dart';
import 'package:trello/screens/board_screen.dart';
import 'package:trello/screens/main_screen.dart';
import 'package:trello/globals.dart' as globals;

class DeleteAttachmentDialog extends StatelessWidget {
  String attachmentId;
  DeleteAttachmentDialog(this.attachmentId, {Key? key}) : super(key: key);

  Future<dynamic> deleteAttachment() {
    Map<String, String> map = new Map<String, String>();
    map['attachment_id'] = attachmentId;

    return globals.Session.post(
      'trello/workspace/boards/lists/cards/attachment/delete',
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
                    "Are you sure you want to delete the Attachment?",
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
                        deleteAttachment().whenComplete(() => {
                          Navigator.of(context).pop()
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
