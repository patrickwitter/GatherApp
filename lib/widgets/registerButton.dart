import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    Key? key,
    this.action,
    required this.text,
    this.color,
  }) : super(key: key);

  final Function()? action;
  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(200, 50),
        primary: color ?? Theme.of(context).iconTheme.color,
      ),
      onPressed: action,
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline5?.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }
}
