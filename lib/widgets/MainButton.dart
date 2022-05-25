import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({Key? key, required this.action, required this.text})
      : super(key: key);

  final Function() action;
  final String text;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: this.action,
      label: Text(
        text,
        style: Theme.of(context).textTheme.headline5?.copyWith(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
      ),
      backgroundColor: Theme.of(context).iconTheme.color,
      foregroundColor: Colors.white,
    );
  }
}
