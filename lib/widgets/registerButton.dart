import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({Key? key, this.action, required this.text})
      : super(key: key);

  final Function? action;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
      onPressed: action == null ? null : () => action,
      child: Text(
        text,
      ),
    );
  }
}
