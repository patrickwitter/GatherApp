import 'package:flutter/material.dart';
import 'package:upc_app/screens/member_alert.dart';
import 'package:upc_app/screens/member_update.dart';
import 'package:upc_app/screens/member_view_home.dart';
import 'package:upc_app/viewmodels/admin_view_viewmodel.dart';
import 'package:upc_app/viewmodels/member_view_viewmodel.dart';
import 'package:upc_app/views/base_view.dart';
import 'package:upc_app/widgets/customActionButton.dart';

class AdminView extends StatelessWidget {
  AdminView({Key? key}) : super(key: key);

  final List<BottomNavigationBarItem> bottomNavItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.contact_mail_sharp),
      label: "Members ContactInfo",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add_alert_outlined),
      label: "Infected Members",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add_alert_outlined),
      label: "Infected Services",
      tooltip: "View Infected Services",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return BaseView<AdminView_ViewModel>(builder: (context, model, child) {
      final List<Widget> screens = [
        Home(
          content: model.availableServicesList(),
        ),
        Center(child: Text("View All Member")),
        Center(child: Text("View Infected Member")),
        Center(
          child: Text("View Infected Service"),
        )
      ];

      return Scaffold(
        appBar: AppBar(
          title: Text("Admin Panel"),
          centerTitle: true,
        ),
        body: IndexedStack(
          index: model.currIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: model.currIndex,
            onTap: (index) => model.updateTabIndex(index),
            items: bottomNavItems,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            selectedIconTheme: IconThemeData(size: 30)),
        floatingActionButton:
            (model.isHome()) ? CustomActionButton() : Container(),
      );
    });
  }
}
