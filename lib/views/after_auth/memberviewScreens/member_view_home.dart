import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key, required this.content}) : super(key: key);

  final Widget content;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: content,
    );
  }
}
