import 'package:flutter/material.dart';
import 'package:trello/utils/colors.dart';

class BoardButton extends StatelessWidget {
  final VoidCallback? onClick;
  final String? text;
  final Color? bgColor;
  final Color? textColor;

  BoardButton({this.onClick, this.text, this.bgColor, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onClick ?? () {},
        child: Text(
          text!,
          style: TextStyle(color: textColor ?? darktextBlue, fontSize: 20, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        style: ElevatedButton.styleFrom(
            primary: bgColor ?? lightBlue,
            fixedSize: const Size(200, 80),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
