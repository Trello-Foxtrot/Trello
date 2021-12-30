import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:trello/popups/card%20popups/delete_attachment.dart';
import 'package:trello/popups/card%20popups/delete_card.dart';
import 'package:trello/popups/card%20popups/delete_comment.dart';
import 'package:trello/popups/card%20popups/rename_card.dart';
import 'package:trello/popups/card%20popups/write_comment.dart';
import 'package:trello/utils/colors.dart';

import 'change_description.dart';

class OpenCardDialog extends StatefulWidget {
  @override
  State<OpenCardDialog> createState() => _OpenCardDialogState();
}

class _OpenCardDialogState extends State<OpenCardDialog> {
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

  late DateTime selectedDate;

  DateTime? card_date = null;

  DateFormat dateFormat = DateFormat.yMMMd('en_US');

  bool isChecked = false;

  _selectDate(BuildContext context) async {
    // TODO tutaj jest wybierana data
    if (card_date != null) {
      selectedDate = card_date!;
    } else {
      selectedDate = DateTime.now();
    }
    selectedDate = (await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
    ))!;
    if (card_date != selectedDate) {
      setState(() {
        card_date = selectedDate;
      });
    }
    // print(card_date);
  }

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
                              style: const TextStyle(color: darkGrey, fontSize: 18),
                            ),
                          ),
                          if (card_date != null)
                            Padding(
                              padding: const EdgeInsets.only(left: 55, top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Due date",
                                      style: TextStyle(color: darkGrey, fontSize: 12, fontStyle: FontStyle.normal),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                        checkColor: Colors.white,
                                        // fillColor: MaterialStateProperty.resolveWith(getColor),
                                        value: isChecked,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isChecked = value!;
                                          });
                                        },
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      TextButton(
                                        onPressed: () => _selectDate(context),
                                        child: Text(
                                          dateFormat.format(card_date!),
                                          style: const TextStyle(color: darkGrey, fontSize: 16, fontStyle: FontStyle.normal),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: isChecked == true
                                                ? Colors.green.shade100
                                                : (card_date!.isBefore(DateTime.now()) ? Colors.red.shade100 : Colors.grey[100])),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.close, color: Colors.grey, size: 20),
                                        onPressed: () {
                                          setState(() {
                                            card_date = null;
                                          });
                                          // showDialog(
                                          //     context: context,
                                          //     builder: (BuildContext context) {
                                          //       return DeleteAttachmentDialog();
                                          //     });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
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
                              style: const TextStyle(color: darkGrey, fontSize: 16, fontStyle: FontStyle.italic),
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
                                              style: const TextStyle(color: darkGrey, fontSize: 15),
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
                                                          return DeleteAttachmentDialog();
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
                                                        return DeleteCommentDialog();
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
                        onPressed: () => _selectDate(context),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'Pick a date',
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
                          // TODO - ATTACHMENT - FILE PICKER
                          // TODO - to działa, teraz trzeba to obsłużyć
                          FilePickerResult? result = await FilePicker.platform.pickFiles();
                          if (result != null) {
                            String? path = result.files.single.path;
                            if (path != null) {
                              File file = File(path);
                            }
                          } else {
                            // User canceled the picker
                          }
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
