import 'package:flutter/material.dart';
import 'package:trello/buttons/board_button.dart';
import 'package:trello/popups/delete_workspace_popup.dart';
import 'package:trello/popups/rename_workspace_popup.dart';

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
            // gap between adjacent chips
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
                      });
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
                      });
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
