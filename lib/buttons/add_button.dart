import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final VoidCallback? onClick;

  AddButton({this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onClick,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
        style: ElevatedButton.styleFrom(
            primary: Colors.grey,
            fixedSize: const Size(200, 80),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
