import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:upc_app/constants/routes.dart';
import 'package:upc_app/locator.dart';
import 'package:upc_app/models/member.dart';

import 'package:upc_app/models/service.dart';
import 'package:upc_app/services/firebase_service.dart';
import 'package:upc_app/services/navigation_service.dart';
import 'package:upc_app/viewmodels/baseviewmodel.dart';
import 'package:upc_app/widgets/customProgressIndicator.dart';
import 'package:upc_app/widgets/memberCard.dart';
import 'package:upc_app/widgets/infectedServiceCard.dart';
import 'package:upc_app/widgets/serviceCardButton.dart';

// ignore: camel_case_types
class AdminView_ViewModel extends BaseViewModel {
  int currIndex = 0;
  FirebaseService _service = locator<FirebaseService>();
  // final f = locator<FirebaseFirestore>();
  NavigationService _navserv = locator<NavigationService>();

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

  Widget availableServicesList() {
    return StreamBuilder<QuerySnapshot>(
        stream: _service.getServices(),
        builder: (context, snapshot) {
          // print(" snap status ${snapshot.hasData}");
          if (snapshot.hasData) {
            List<Service> servList = _serviceList(
              snapshot.data,
            );
            return ListView.builder(
                itemCount: servList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ServiceCardButton(
                    serv: servList[index],
                  );
                });
          } else if (!snapshot.hasData) {
            return Center(
              child: CustomCircularProgressIndicator(),
            );
          } else {
            return Text("error");
          }
        });
  }

  Widget allMembersList() {
    return StreamBuilder<QuerySnapshot>(
        stream: _service.getMembers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Member> memList = _memberList(
              snapshot.data,
            );
            return ListView.builder(
                itemCount: memList.length,
                itemBuilder: (BuildContext context, int index) {
                  return MemberCard(
                    mem: memList[index],
                  );
                });
          } else if (!snapshot.hasData) {
            return Text("No data");
          } else {
            return Text("error");
          }
        });
  }

  Widget infectedMembersList() {
    return StreamBuilder<QuerySnapshot>(
        stream: _service.getInfecMembers(),
        builder: (context, snapshot) {
          //print(" snap status ${snapshot.hasData}");
          if (snapshot.hasData) {
            List<Member> memList = _memberList(
              snapshot.data,
            );
            return ListView.builder(
                itemCount: memList.length,
                itemBuilder: (BuildContext context, int index) {
                  return MemberCard(
                    mem: memList[index],
                  );
                });
          } else if (!snapshot.hasData) {
            return Text("No data");
          } else {
            return Text("error");
          }
        });
  }

  Widget infectedServicesList() {
    return StreamBuilder<QuerySnapshot>(
        stream: _service.getInfecServices(),
        builder: (context, snapshot) {
          //print(" snap status ${snapshot.hasData}");
          if (snapshot.hasData) {
            List<Service> servList = _serviceList(
              snapshot.data,
            );
            return ListView.builder(
                itemCount: servList.length,
                itemBuilder: (BuildContext context, int index) {
                  return InfectedServiceCard(
                    serv: servList[index],
                  );
                });
          } else if (!snapshot.hasData) {
            return Text("No data");
          } else {
            return Text("error");
          }
        });
  }

  List<Service> _serviceList(QuerySnapshot<Object?>? data) {
    List<Service> servList = [];
    data!.docs.forEach((doc) {
      Map<String, dynamic> servdata = doc.data() as Map<String, dynamic>;
      servList.add(Service.fromJson(servdata));
    });
    return servList;
  }

  List<Member> _memberList(QuerySnapshot<Object?>? data) {
    List<Member> memList = [];
    data!.docs.forEach((doc) {
      Map<String, dynamic> memdata = doc.data() as Map<String, dynamic>;
      memList.add(Member.fromJson(memdata));
    });
    return memList;
  }

  void showServiceForm() {
    _navserv.navigateTo(Routes.ServiceForm);
  }

  void showNotifcation() {
    _navserv.navigateTo(Routes.NoficationAdminPage);
  }
}
