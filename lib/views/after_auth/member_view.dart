import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:upc_app/viewmodels/member_view_viewmodel.dart';
import 'package:upc_app/views/base_view.dart';
import 'package:upc_app/widgets/MainButton.dart';

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

  @override
  Widget build(BuildContext context) {
    return BaseView<MemberView_ViewModel>(
        onModelReady: (model) => model.initialize(),
        builder: (context, model, child) {
          final List<Widget> screens = [
            MemberHome(
              content: model.availableServicesList(),
            ),
            UpdateMember(),
            MemberAlerts(
                content: Text(
              "Alerts",
              style: Theme.of(context).textTheme.caption,
            )),
          ];

          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
              leadingWidth: 25.w,
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              title: Text(
                "Member Panel",
                style: Theme.of(context).textTheme.headline4,
              ),
              centerTitle: true,
              leading: TextButton(
                onPressed: () => model.signout(),
                style: TextButton.styleFrom(
                  primary: Theme.of(context).colorScheme.secondary,
                ),
                child: Text(
                  "Logout",
                  style: Theme.of(context).textTheme.caption?.copyWith(
                        fontSize: 13.sp,
                      ),
                ),
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
            body: IndexedStack(
              index: model.currIndex,
              children: screens,
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: model.currIndex,
              onTap: (index) => model.updateTabIndex(index),
              items: bottomNavItems,
              type: BottomNavigationBarType.fixed,
              selectedItemColor:
                  Theme.of(context).colorScheme.onPrimaryContainer,
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
