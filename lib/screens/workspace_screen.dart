import 'package:flutter/material.dart';
import 'package:trello/utils/colors.dart';


class WorkspaceScreen extends StatefulWidget {
  @override
  _WorkspaceScreenState createState() => _WorkspaceScreenState();
}

class _WorkspaceScreenState extends State<WorkspaceScreen> {
  int selectedTab = 1;

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
            onPressed: () {


            },
            icon: const Icon(
              Icons.person,
              size: 30,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.login,
              size: 30,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 20,),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: lightBlue,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.tv,
                      color: darkBlue,
                      size: 50,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Work",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                // Wrap(
                //   crossAxisAlignment: WrapCrossAlignment.center,
                //   //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     TabContainer(
                //       text: "BOARDS",
                //       onClick: () {
                //         selectedTab = 1;
                //         // print(selectedTab);
                //         setState(() {});
                //       },
                //       isActive: selectedTab == 1 ? true : false,
                //     ),
                //     TabContainer(
                //         text: "MEMBERS",
                //         onClick: () {
                //           selectedTab = 2;
                //           // ignore: avoid_print
                //           //print(selectedTab);
                //           setState(() {});
                //         },
                //         isActive: selectedTab == 2 ? true : false),
                //     TabContainer(
                //         text: "SETTINGS",
                //         onClick: () {
                //           selectedTab = 3;
                //           //debugPrint("$selectedTab");
                //           setState(() {});
                //         },
                //         isActive: selectedTab == 3 ? true : false),
                //   ],
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
              ],
            ),
          ),
          // Expanded(child:   selectedTab == 1
          //     ? BoardsTab()
          //     : selectedTab == 2
          //     ? MembersTab()
          //     : selectedTab == 3
          //     ? SettingsTab()
          //     : BoardsTab()),

        ],
      ),
    );
  }
}

// class TabContainer extends StatelessWidget {
//   final String? text;
//   final VoidCallback? onClick;
//   final bool isActive;
//
//   TabContainer({this.text, this.onClick, required this.isActive});
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onClick,
//       child: Text(
//         text!,
//         style: TextStyle(color: isActive ? dialogTitleColor : whiteColor, fontSize: 20, fontWeight: FontWeight.w600),
//       ),
//       style: ElevatedButton.styleFrom(
//           elevation: 0,
//           primary: isActive ? whiteColor : boardButtonBgColor,
//           fixedSize: const Size(150, 35),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
//     );
//   }
// }
