import 'package:flutter/material.dart';
import 'package:trello/utils/colors.dart';

class MembersTab extends StatefulWidget {
  @override
  _MembersTabState createState() => _MembersTabState();
}

class _MembersTabState extends State<MembersTab> {
  List<String> memberList = [
    "11111@gmail.com",
    "22222@gmail.com",
    "33333@gmail.com",
    "44444@gmail.com",
    "555@gmail.com",
  ];

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
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .2,
                    vertical: 10),
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
                          primary: lightGrey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
