import 'package:flutter/material.dart';

class ViewInfectedServices extends StatelessWidget {
  const ViewInfectedServices({required this.content, Key? key})
      : super(key: key);

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return this.content;
  }
}
