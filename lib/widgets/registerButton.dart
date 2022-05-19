import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({Key? key, this.action, required this.text})
      : super(key: key);

  final Function? action;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(200, 50),
        primary: Theme.of(context).iconTheme.color,
      ),
      onPressed: action == null ? null : () => action,
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline5?.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }
}
