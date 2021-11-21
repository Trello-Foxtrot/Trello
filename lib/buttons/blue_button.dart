import 'package:flutter/material.dart';
import 'package:trello/utils/colors.dart';

class DialogBlueButton extends StatelessWidget {
  final VoidCallback? onClick;
  final String? text;

  DialogBlueButton({this.onClick, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onClick,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text!,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        style:
            ElevatedButton.styleFrom(primary: darkBlue, shape: StadiumBorder()),
      ),
    );
  }
}
