import 'package:flutter/material.dart';
import 'package:trello/buttons/add_button.dart';
import 'package:trello/buttons/board_button.dart';
import 'package:trello/popups/workspace%20popups/create_workspace.dart';
import 'package:trello/screens/workspace_screen.dart';
import 'package:trello/utils/colors.dart';
import 'package:trello/globals.dart' as globals;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> myWorkSpacesList = [];
  List<String> myWorkSpacesIDList = [];

  List<String> guestWorkspace = [];
  List<String> guestWorkspaceID = [];

  void updateWorkspacesLists() {
    globals.Session.post(
      'trello/workspace',
      <String, String>{}
    ).then((resMap) {
      setState(() {
        myWorkSpacesList = resMap['admin'].cast<String>();
        myWorkSpacesIDList = resMap['admin_id'].cast<String>();

        guestWorkspace = resMap['guest'].cast<String>();
        guestWorkspaceID = resMap['guest_id'].cast<String>();
      });
    });
  }

  @override
  void initState() {
    updateWorkspacesLists();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBlue,
        centerTitle: true,
        title: const Text(
          "Trello",
          style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.person,
              size: 30,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 30,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Text(
                  "YOUR WORKSPACES",
                  style: TextStyle(fontWeight: FontWeight.bold, color: darkGrey, fontSize: 25),
                ),
              ),
              Wrap(
                spacing: 30, // gap between adjacent chips
                runSpacing: 40,
                children: myWorkSpacesList.isEmpty
                    ? List.generate(
                        1,
                        (index) => AddButton(
                              onClick: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CreateWorkSpaceDialog();
                                    }).whenComplete(() => updateWorkspacesLists());
                              },
                            ))
                    : List.generate(myWorkSpacesList.length + 1, (index) {
                        if (index < myWorkSpacesList.length) {
                          return BoardButton(
                            text: myWorkSpacesList[index],
                            onClick: () {
                              globals.CurrentWorkspace.id = int.parse(myWorkSpacesIDList[index]);
                              globals.CurrentWorkspace.title = myWorkSpacesList[index];

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WorkspaceScreen()
                                ),
                              ).whenComplete(() => updateWorkspacesLists());
                            },
                          );
                        } else {
                          return AddButton(
                            onClick: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CreateWorkSpaceDialog();
                                  }).whenComplete(() => updateWorkspacesLists());
                            },
                          );
                        }
                      }),
              ),
              const Padding(
                //padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                padding: EdgeInsets.fromLTRB(30, 60, 30, 30),
                child: Text(
                  "GUEST WORKSPACES",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: darkGrey,
                      fontSize: 25),
                ),
              ),
              Wrap(
                spacing: 30, // gap between adjacent chips
                runSpacing: 40,
                children: List.generate(guestWorkspace.length, (index) {
                  return BoardButton(
                    text: guestWorkspace[index],
                    onClick: () {
                      globals.CurrentWorkspace.id = int.parse(guestWorkspaceID[index]);
                      globals.CurrentWorkspace.title = guestWorkspace[index];

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WorkspaceScreen()
                        ),
                      ).whenComplete(() => updateWorkspacesLists());
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
