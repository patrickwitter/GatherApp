import 'package:flutter/material.dart';
import 'package:upc_app/viewmodels/admin_view_viewmodel.dart';
import 'package:upc_app/views/after_auth/adminviewScreens/viewInfecMembers.dart';
import 'package:upc_app/views/after_auth/adminviewScreens/viewMember.dart';
import 'package:upc_app/views/base_view.dart';
import 'adminviewScreens/admin_view_home.dart';

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
        AdminHome(
          content: model.availableServicesList(),
        ),
        ViewMembers(content: model.allMembersList()),
        ViewInfecMembers(content: model.infectedMembersList()),
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
        floatingActionButton: (model.isHome())
            ? FloatingActionButton.extended(
                onPressed: () => model.showServiceForm(),
                label: Text("Create Service"))
            : Container(),
      );
    });
  }
}
