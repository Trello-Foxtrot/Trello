import 'package:flutter/material.dart';
import 'package:trello/buttons/blue_button.dart';
import 'package:trello/buttons/cancel_button.dart';
import 'package:trello/screens/board_screen.dart';
import 'package:trello/screens/workspace_screen.dart';
import 'package:http/http.dart' as http;
import 'package:trello/globals.dart' as globals;

class RenameCardDialog extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _title = TextEditingController();

  String cardId;

  RenameCardDialog(this.cardId, {Key? key}) : super(key: key);

  Future<dynamic> renameCard(String name) {
    Map<String, String> map = new Map<String, String>();
    map['card_id'] = cardId;
    map['new_name'] = name;

    return globals.Session.post(
      'trello/workspace/boards/lists/cards/rename',
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
        height: 350,
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
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Text(
                    "Change a Card name",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _title,
                  keyboardType: TextInputType.name,
                  autofocus: false,
                  decoration: const InputDecoration(
                    hintText: 'Title',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
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
                      text: "Change",
                      onClick: () {
                        if (_formKey.currentState!.validate()) {
                          renameCard(_title.text).then((value) => {
                              Navigator.of(context).pop()
                          });
                        }
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
