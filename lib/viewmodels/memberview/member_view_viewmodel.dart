import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:upc_app/constants/routes.dart';
import 'package:upc_app/locator.dart';
import 'package:upc_app/models/member.dart';
import 'package:upc_app/services/firebase_service.dart';
import 'package:upc_app/services/navigation_service.dart';
import 'package:upc_app/viewmodels/baseviewmodel.dart';

// ignore: camel_case_types
class MemberView_ViewModel extends BaseViewModel {
  int currIndex = 0;
  FirebaseService _service = locator<FirebaseService>();
  NavigationService _navserv = locator<NavigationService>();
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  void updateTabIndex(int newindex) {
    currIndex = newindex;
    notifyListeners();
  }

  bool isHome() {
    return currIndex == 0;
  }

  void signout() {
    _service.logoutUser();
  }

  void showNotification() {
    _navserv.navigateTo(Routes.NotificationPage);
  }

  void covidAlert() async {
    print("hello");
    Member mem = await getMem();
    _service.addInfectedMember(mem);
    _service.addInfectedService(mem);
    _navserv.showSnackBar("Covid Alert Sent Successfully");
  }

  Widget getAlerts() {
    return StreamBuilder<QuerySnapshot>(
      stream: _service.x("test"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print("has data");
          print("${snapshot.data!.docs.length}");
          return Text("has data ");
        } else if (snapshot.hasError) {
          print("error data \n ${snapshot.error}");

          return Text(" error data");
        } else {
          return Text(" no data");
        }
      },
    );
  }

  Future<Member> getMem() async {
    DocumentSnapshot doc = await _service.getMember();
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    Member mem = Member.fromJson(data);

    return mem;
  }
}
