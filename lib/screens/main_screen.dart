import 'package:flutter/material.dart';
import 'package:trello/buttons/add_button.dart';
import 'package:trello/buttons/board_button.dart';
import 'package:trello/popups/create_workspace_popup.dart';
import 'package:trello/screens/workspace_screen.dart';
import 'package:trello/utils/colors.dart';
import 'package:http/http.dart' as http;
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
    http.post(
      Uri.parse('http://localhost:8000/trello/workspace')
    ).then((response) {
      Map<String, dynamic> map = response.headers;
      setState(() {
        myWorkSpacesList = map['admin']?.split(',') ?? [];
        myWorkSpacesList.removeLast();
        myWorkSpacesIDList = map['admin_id']?.split(',') ?? [];
        myWorkSpacesIDList.removeLast();

        guestWorkspace = map['guest']?.split(',') ?? [];
        guestWorkspace.removeLast();
        guestWorkspaceID = map['guest_id']?.split(',') ?? [];
        guestWorkspaceID.removeLast();
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
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
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
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(
          //     Icons.login,
          //     size: 30,
          //     color: Colors.white,
          //   ),
          // ),
          // const SizedBox(
          //   width: 30,
          // ),
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
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: darkGrey,
                      fontSize: 25),
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
                                    });
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
                              );
                            },
                          );
                        } else {
                          return AddButton(
                            onClick: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CreateWorkSpaceDialog();
                                  });
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
                      );
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
