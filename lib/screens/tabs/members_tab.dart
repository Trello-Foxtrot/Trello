import 'package:flutter/material.dart';
import 'package:trello/utils/colors.dart';
import 'package:trello/globals.dart' as globals;

class MembersTab extends StatefulWidget {
  @override
  _MembersTabState createState() => _MembersTabState();
}

class _MembersTabState extends State<MembersTab> {
  List<String> memberList = [];

  _MembersTabState() {
    updateMembersLists();
  }

  void updateMembersLists() {
    Map<String, String> map = <String, String>{};
    map['id'] = globals.CurrentWorkspace.id.toString();

    globals.Session.post(
        'trello/workspace/members',
        map,
    ).then((resMap) {
      setState(() {
        memberList = resMap['members'].split(',');
        memberList.removeLast();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: ListView.builder(
          itemCount: memberList.length,
          itemBuilder: (c, index) {
            return SizedBox(
              width: 100,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .2, vertical: 10),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      memberList[index],
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        index == 0 ? "Admin" : "Member",
                        style: const TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: lightGrey, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
