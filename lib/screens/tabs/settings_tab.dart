import 'package:flutter/material.dart';
import 'package:trello/buttons/board_button.dart';
import 'package:trello/popups/workspace%20popups/delete_workspace.dart';
import 'package:trello/popups/workspace%20popups/rename_workspace.dart';

class SettingsTab extends StatefulWidget {
  @override
  _SettingsTabState createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Wrap(
            spacing: 30,
            runSpacing: 40,
            alignment: WrapAlignment.spaceEvenly,
            runAlignment: WrapAlignment.spaceEvenly,
            children: [
              BoardButton(
                onClick: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return RenameWorkspaceDialog();
                      }).whenComplete(() => Navigator.of(context).pop());
                },
                text: "Change workspace name",
              ),
              BoardButton(
                text: "Delete workspace",
                textColor: Colors.white,
                onClick: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return DeleteWorkspaceDialog();
                      }).whenComplete(() => Navigator.of(context).pop());
                },
                bgColor: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
