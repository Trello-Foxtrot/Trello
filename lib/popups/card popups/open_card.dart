import 'dart:html';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:trello/buttons/board_button.dart';
import 'package:trello/popups/card%20popups/delete_card.dart';
import 'package:trello/popups/card%20popups/rename_card.dart';
import 'package:trello/popups/card%20popups/write_comment.dart';
import 'package:trello/popups/list%20popups/delete_list.dart';
import 'package:trello/utils/colors.dart';
import 'package:flutter/widgets.dart';
import 'change_description.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OpenCardDialog extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String card_title = "Here is a title";
  String description =
      "text text text text text text text text  frrrf frrr frfr frfr frr fr a a a a a a a a a a a a a a a a a xt text text text text text text text ";
  List<String> list_of_attachments = [
    "imageqwertyuqwertyuiqwertyuiqwertyuioqwertyuioqwertyuioqwertyuioqwertyuioqwertyuioqwertyuioqwertyuioqwertyui.png",
    "qwerty.eps",
    "profile_12345.zip"
  ];

  var list_of_comments = [
    ["111@gmail.com", "text text text”"],
    ["22@gmail.com", "aaaa"],
    [
      "111@gmail.com",
      "text r r r  r r  r r r r r r r r r r r r r r r r r r r r r r r r r r r r r r r r r r r r r r r r r r rr r  r r r rr r r r  rr r r rr  r r  text text”"
    ],
    [
      "22@gmail.com",
      "qwertyuiqwertyuiqwertyuiqwertyuioqwertyuiwertyuirtyuirtyui wertyuwertrewqertrewqertt wertyui ertyuiuytrertyuytrtyuyttyuytyuyyuyuyuyuyuyuyyuyu"
    ],
    ["111@gmail.com", "text text text”"],
    ["22@gmail.com", "aaaa"],
    [
      "111@gmail.com",
      "text r r r  r r  r r r r r r r r r r r r r r r r r r r r r r r r r r r r r r r r r r r r r r r r r r rr r  r r r rr r r r  rr r r rr  r r  text text”"
    ],
    [
      "22@gmail.com",
      "qwertyuiqwertyuiqwertyuiqwertyuioqwertyuiwertyuirtyuirtyui wertyuwertqwehytrewqwertytrewqwer wertyui ertyuiuytrertyuytrtyuyttyuytyuyyuyuyuyuyuyuyyuyu"
    ],
    ["333@gmail.com", "abs"]
  ];


  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: 900,
        height: MediaQuery.of(context).size.height * 0.98,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: const <Widget>[
                              Icon(Icons.title, color: Colors.grey, size: 40),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Title",
                                style: TextStyle(color: darkGrey, fontSize: 26, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 55),
                            child: Text(
                              card_title,
                              style: TextStyle(color: darkGrey, fontSize: 18),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: const <Widget>[
                              Icon(Icons.article_outlined, color: Colors.grey, size: 40),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Description",
                                style: TextStyle(color: darkGrey, fontSize: 26, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 55),
                            child: Text(
                              description,
                              style: TextStyle(color: darkGrey, fontSize: 16, fontStyle: FontStyle.italic),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: const <Widget>[
                              Icon(Icons.attach_file, color: Colors.grey, size: 40),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Attachments",
                                style: TextStyle(color: darkGrey, fontSize: 26, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: List.generate(
                              list_of_attachments.length,
                              (index) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 55),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 4,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              list_of_attachments[index],
                                              style: TextStyle(color: darkGrey, fontSize: 15),
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 25, right: 15),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                IconButton(
                                                  icon: const Icon(Icons.close, color: Colors.grey, size: 25),
                                                  onPressed: () {
                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext context) {
                                                          return DeleteListDialog();
                                                        });
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: const <Widget>[
                              Icon(Icons.insert_comment_outlined, color: Colors.grey, size: 40),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Comments",
                                style: TextStyle(color: darkGrey, fontSize: 26, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: List.generate(
                              list_of_comments.length,
                              (index) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 55),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        list_of_comments[index][0],
                                        style: TextStyle(color: lightGrey, fontSize: 12, fontStyle: FontStyle.italic),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 4,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context).size.width,
                                                  margin: const EdgeInsets.symmetric(vertical: 4),
                                                  padding: const EdgeInsets.all(6),
                                                  decoration: BoxDecoration(
                                                    color: lightBlue,
                                                    borderRadius: BorderRadius.circular(5),
                                                  ),
                                                  child: Text(
                                                    list_of_comments[index][1],
                                                    style: TextStyle(color: darkGrey, fontSize: 15),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 1, right: 1),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                IconButton(
                                                  icon: const Icon(Icons.close, color: Colors.grey, size: 25),
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext context) {
                                                        return DeleteListDialog();
                                                      },
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.grey,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 35,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return DeleteCardDialog();
                              });
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'Delete the Card',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(primary: lightGrey, shape: const StadiumBorder()),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 35,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return RenameCardDialog();
                              });
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'Change title',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(primary: lightGrey, shape: const StadiumBorder()),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 35,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return ChangeDescriptionDialog();
                              });
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'Change description',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(primary: lightGrey, shape: const StadiumBorder()),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 35,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () async {
                          // Navigator.of(context).pop();
                          // FilePickerResult? result = await FilePicker.platform.pickFiles();
                          // // File file = await FilePicker.getFile();
                          // // final attachment = SentryAttachment.fromByteData(bytedata);
                          // if (result != null) {
                          //   File file = File(result.files.single.path, 2);
                          // } else {
                          //   // User canceled the picker
                          // }
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'Add an attachment',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(primary: lightGrey, shape: const StadiumBorder()),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 35,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return WriteComment();
                              });
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'Write a comment',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(primary: lightGrey, shape: const StadiumBorder()),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
