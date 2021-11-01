import 'package:flutter/material.dart';

class CustomActionButton extends StatelessWidget {
  const CustomActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      child: FittedBox(
        fit: BoxFit.fill,
        child: FloatingActionButton(
          child: TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.alarm,
              size: 30,
              color: Colors.white,
            ),
            label: Text(
              "",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
