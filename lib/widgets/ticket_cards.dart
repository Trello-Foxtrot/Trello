import 'dart:html';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Widget tickets(BuildContext context) {
  return Card(
    elevation: 2,
    child: Container(
      padding: EdgeInsets.all(30),
      color: Colors.lightBlue.shade50,
      // width: MediaQuery.of(context).size.width < 800
      //     ? MediaQuery.of(context).size.width - 100
      //     : MediaQuery.of(context).size.width / 5.5,
      // height: MediaQuery.of(context).size.height / 6,
      width: 250,
      height: 120,
      child: Center(
        child: Text(
          "Daily Tasks",
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
            // fontWeight: FontWeight.bold,
            fontFamily: 'HelveticaNeue',
          ),
        ),
      ),
    ),
  );
}
