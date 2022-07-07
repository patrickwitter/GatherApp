import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({required this.children, Key? key}) : super(key: key);

  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Drawer(
      backgroundColor: themeData.scaffoldBackgroundColor,
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 10.h,
            ),
          ),
          ...children
        ],
      ),
    );
  }
}
