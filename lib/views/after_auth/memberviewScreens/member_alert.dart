import 'package:flutter/material.dart';

class MemberAlerts extends StatelessWidget {
  const MemberAlerts({Key? key, required this.content}) : super(key: key);
  final Widget content;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: content,
    );
  }
}
