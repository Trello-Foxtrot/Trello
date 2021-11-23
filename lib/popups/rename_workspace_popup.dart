import 'package:flutter/material.dart';
import 'package:trello/buttons/blue_button.dart';
import 'package:trello/buttons/cancel_button.dart';
import 'package:trello/screens/workspace_screen.dart';

class RenameWorkspaceDialog extends StatelessWidget {
  final snackBar = const SnackBar(
    content: Text("Workspace's new name is empty"),
    backgroundColor: Colors.red,
  );

  TextEditingController controller = TextEditingController();

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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 40),
                child: Text(
                  "Change a Workspace name",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              TextFormField(
                controller: controller,
                keyboardType: TextInputType.name,
                autofocus: false,
                decoration: const InputDecoration(
                  hintText: 'Title',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
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
                    text: "Change",
                    onClick: () {
                      if (controller.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        final snackBarSuccess = SnackBar(
                          content: Text(
                              'Workspace name is changed to "${controller.text}"'),
                          backgroundColor: Colors.green,
                        );
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackBarSuccess);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WorkspaceScreen()),
                        );
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
