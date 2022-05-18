import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({Key? key, required this.child, required this.action})
      : super(key: key);

  final Widget child;
  final Function() action;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            minimumSize: Size(150, 50),
            side: BorderSide(
              style: BorderStyle.solid,
            ),
          ),
          onPressed: action,
          child: this.child),
    );
  }
}
