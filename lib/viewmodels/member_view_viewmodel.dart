import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:upc_app/constants/routes.dart';
import 'package:upc_app/enums/enums.dart';
import 'package:upc_app/locator.dart';
import 'package:upc_app/models/member.dart';

import 'package:upc_app/models/service.dart';
import 'package:upc_app/services/firebase_service.dart';
import 'package:upc_app/services/navigation_service.dart';
import 'package:upc_app/viewmodels/baseviewmodel.dart';
import 'package:upc_app/widgets/serviceButton.dart';
import 'package:upc_app/widgets/serviceCard.dart';

// ignore: camel_case_types
class MemberView_ViewModel extends BaseViewModel {
  int currIndex = 0;
  FirebaseService _service = locator<FirebaseService>();
  NavigationService _navserv = locator<NavigationService>();

  bool? isreg;
  List<Service> servList = [];
  Map<String, bool> regMap = {};
  late Stream _serviceStream;
  late Member _member;

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
    Member mem = await getMem();
    _service.addInfectedMember(mem);
    _service.addInfectedService(mem);
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

  Widget availableServicesList() {
    return StreamBuilder<QuerySnapshot>(
        stream: _serviceStream as Stream<QuerySnapshot<Object?>>,
        builder: (context, snapshot) {
          // print(" snap status ${snapshot.hasData}");
          if (snapshot.hasData) {
            servList = _serviceList(
              snapshot.data,
            );
            return ListView.builder(
                itemCount: servList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ServiceButton(
                    registerButton: registerButton(servList[index]),
                    availSpace: servList[index].availSp,
                    numAttend: servList[index].numAttend,
                    servDate: servList[index].serviceDateFormat,
                  );
                });
          } else if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Text("error");
          }
        });
  }

  Widget registerButton(Service serv) {
    return StreamBuilder<DocumentSnapshot>(
        stream: _service.isMemberRegisteredService(serv, _member),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.exists) {
            return ElevatedButton(onPressed: null, child: Text("Registered"));
          } else if (snapshot.hasData && !snapshot.data!.exists) {
            if (!serv.isFull()) {
              return ElevatedButton(
                  onPressed: () => register(serv.id, serv),
                  child: Text("Register"));
            } else {
              return ElevatedButton(onPressed: null, child: Text("Full"));
            }
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  void register(String serviceId, Service serv) async {
    serv.register();
    _service.addService(serv);
    Member mem = await getMem();
    _service.registerMemberService(serv, mem);
  }

  List<Service> _serviceList(QuerySnapshot<Object?>? data) {
    List<Service> servList = [];
    data!.docs.forEach((doc) {
      Map<String, dynamic> servdata = doc.data() as Map<String, dynamic>;
      servList.add(Service.fromJson(servdata));
    });
    return servList;
  }

  Future<Member> getMem() async {
    DocumentSnapshot doc = await _service.getMember();
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    Member mem = Member.fromJson(data);

    return mem;
  }

  void initialize() async {
    _serviceStream = _service.getServices();
    _member = await getMem();
    setState(ViewState.idle);
  }
}
