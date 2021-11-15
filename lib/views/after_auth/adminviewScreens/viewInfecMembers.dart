import 'package:flutter/material.dart';

class ViewInfecMembers extends StatelessWidget {
  const ViewInfecMembers({required this.content, Key? key}) : super(key: key);

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: content,
    );
  }
}
