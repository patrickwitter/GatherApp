import 'package:flutter/material.dart';

class ViewMembers extends StatelessWidget {
  const ViewMembers({required this.content, Key? key}) : super(key: key);

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return this.content;
  }
}
