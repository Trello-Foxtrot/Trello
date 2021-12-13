import 'package:flutter/material.dart';
import 'package:trello/utils/colors.dart';

class OpenCardDialog extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String card_title = "Here is a title";
  String description =
      "text text text text text text text text  frrrf frrr frfr frfr frr fr a a a a a a a a a a a a a a a a a xt text text text text text text text ";
  List<String> list_of_attachments = ["image.png", "qwerty.eps", "profile_12345.zip"];

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
        height: MediaQuery
            .of(context)
            .size
            .height * 0.98,
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
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                          style: TextStyle(color: darkGrey, fontSize: 17),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
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
                      Padding(
                        padding: const EdgeInsets.only(left: 55),
                        child: Column(
                          children: [
                            Row(
                              children: const [
                                Text(
                                  "image.jpg",
                                  style: TextStyle(color: darkGrey, fontSize: 15),
                                ),
                                SizedBox(
                                  width: 445,
                                ),
                                Icon(
                                  Icons.close,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                    "image.png",
                                    style: TextStyle(color: darkGrey, fontSize: 15), ,
                                ),
                                SizedBox(
                                  width: 440,
                                ),
                                Icon(
                                  Icons.close,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  "qwert.file",
                                ),
                                SizedBox(
                                  width: 445,
                                ),
                                Icon(
                                  Icons.close,
                                  color: Colors.grey,
                                )
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
                      Padding(
                        padding: const EdgeInsets.only(left: 55),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "111@gmail.com",
                            ),
                            Container(
                              height: 50,
                              // width: 550,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      height: 50,
                                      // width: 500,
                                      decoration: BoxDecoration(
                                        color: Colors.blue.shade200,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                          'Text Text Text Text Text TextText Text Text Text Text Text Text Text Text Text\n Text Text Text Text Text v')),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Icon(
                                    Icons.close,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "113@gmail.com",
                          ),
                          Container(
                            height: 100,
                            // width: 550,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    height: 50,
                                    // width: 500,
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade200,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                        'Text Text Text Text Text TextText Text Text Text Text Text Text Text Text Text\n Text Text Text Text Text Text Text Text Text Text Text Text')),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.close,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "121@gmail.com",
                          ),
                          Container(
                            height: 35,
                            // width: 550,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    height: 35,
                                    // width: 500,
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade200,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text('Text Text Text Text Text TextText Text ')),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.close,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.grey,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 35,
                      width: 200,
                      // decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(8),
                      //     color: Colors.grey
                      // ),
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.of(context).pop();
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
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 35,
                      width: 200,
                      // decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(8),
                      //     color: Colors.grey
                      // ),
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.of(context).pop();
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
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 35,
                      width: 200,
                      // decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(8),
                      //     color: Colors.grey
                      // ),
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.of(context).pop();
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
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 35,
                      width: 200,
                      // decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(8),
                      //     color: Colors.grey
                      // ),
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.of(context).pop();
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
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 35,
                      width: 200,
                      // decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(8),
                      //     color: Colors.grey
                      // ),
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.of(context).pop();
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
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                // ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
