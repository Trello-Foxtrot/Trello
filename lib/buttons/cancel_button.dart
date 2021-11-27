import 'package:flutter/material.dart';
import 'package:trello/utils/colors.dart';

class CancelButton extends StatelessWidget {
  final VoidCallback? onClick;

  const CancelButton({this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Cancel',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        style: ElevatedButton.styleFrom(primary: lightGrey, shape: const StadiumBorder()),
      ),
    );
  }
}
