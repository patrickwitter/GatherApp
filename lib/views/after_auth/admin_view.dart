import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:upc_app/viewmodels/adminview/admin_view_viewmodel.dart';
import 'package:upc_app/views/after_auth/adminviewScreens/viewInfecMembers.dart';
import 'package:upc_app/views/after_auth/adminviewScreens/viewInfectedService.dart';
import 'package:upc_app/views/after_auth/adminviewScreens/viewMember.dart';
import 'package:upc_app/views/base_view.dart';
import 'package:upc_app/widgets/MainButton.dart';
import 'package:upc_app/widgets/drawer.dart';
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
      label: "Members",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sick),
      label: "IMembers",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add_alert_outlined),
      label: "IServices",
      tooltip: "View Infected Services",
    )
  ];

  final List<Widget> screens = const [
    AdminHome(),
    ViewMembers(),
    ViewInfecMembers(),
    ViewInfectedServices(),
  ];

  @override
  Widget build(BuildContext context) {
    return BaseView<AdminView_ViewModel>(builder: (context, model, child) {
      return Scaffold(
        key: model.scaffoldkey,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          leadingWidth: 25.w,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title: Text(
            "Admin Panel",
            style: Theme.of(context).textTheme.headline4,
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              size: 10.w,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () => model.scaffoldkey.currentState!.openDrawer(),
          ),
          actions: [
            IconButton(
              onPressed: () => model.showNotifcation(),
              icon: Icon(
                Icons.announcement,
              ),
              color: Theme.of(context).colorScheme.onSurface,
              iconSize: 7.w,
              tooltip: "Send Notifcations",
            )
          ],
        ),
        drawer: CustomDrawer(
          children: [
            ListTile(
              leading: Icon(
                Icons.logout,
                size: 5.w,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                "Logout",
                style: Theme.of(context).textTheme.caption?.copyWith(
                      fontSize: 13.sp,
                    ),
              ),
              onTap: () => model.signout(),
            ),
          ],
        ),
        body: IndexedStack(
          index: model.currIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            currentIndex: model.currIndex,
            onTap: (index) => model.updateTabIndex(index),
            items: bottomNavItems,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Theme.of(context).colorScheme.onPrimaryContainer,
            unselectedItemColor:
                Theme.of(context).colorScheme.onSecondaryContainer,
            selectedIconTheme: IconThemeData(size: 8.w)),
        floatingActionButton: (model.isHome())
            ? HomeButton(
                action: () => model.showServiceForm(),
                text: "Create Service",
              )
            : Container(),
      );
    });
  }
}
