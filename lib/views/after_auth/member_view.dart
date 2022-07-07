import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:upc_app/viewmodels/memberview/member_view_viewmodel.dart';
import 'package:upc_app/views/base_view.dart';
import 'package:upc_app/widgets/MainButton.dart';
import 'package:upc_app/widgets/drawer.dart';

import 'memberviewScreens/member_alert.dart';
import 'memberviewScreens/member_update.dart';
import 'memberviewScreens/member_view_home.dart';

class MemberView extends StatelessWidget {
  MemberView({Key? key}) : super(key: key);

  final List<BottomNavigationBarItem> bottomNavItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.contact_mail_sharp),
      label: "ContactInfo",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add_alert_outlined),
      label: "Alerts",
    )
  ];
  final List<Widget> screens = const [
    MemberHome(),
    UpdateMember(),
    MemberAlerts(),
  ];
  @override
  Widget build(BuildContext context) {
    return BaseView<MemberView_ViewModel>(builder: (context, model, child) {
      return Scaffold(
        key: model.scaffoldkey,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          leadingWidth: 20.w,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title: Text(
            "Member Panel",
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
              onPressed: () => model.showNotification(),
              icon: Icon(
                Icons.announcement,
              ),
              color: Theme.of(context).colorScheme.onSurface,
              iconSize: 7.w,
              tooltip: "See Notifcations",
            )
          ],
        ),
        drawer: CustomDrawer(
          children: [
            ListTile(
              leading: Icon(
                Icons.logout,
                size: 8.w,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                "Logout",
                style: Theme.of(context).textTheme.headline5,
              ),
              onTap: () => model.signout(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                children: [
                  Text(
                    "Dark Mode",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Transform.scale(
                    scale: 1.25,
                    child: Switch.adaptive(
                        value: model.getDarkMode(),
                        onChanged: (isDarkMode) {
                          model.switchDarkMode(isDarkMode);
                        }),
                  ),
                ],
              ),
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
          selectedIconTheme: IconThemeData(size: 8.w),
        ),
        floatingActionButton: (model.isHome())
            ? HomeButton(
                action: () => model.covidAlert(),
                text: "Covid Alert",
              )
            : Container(),
      );
    });
  }
}
