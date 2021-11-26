import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:upc_app/locator.dart';
import 'package:upc_app/models/member.dart';

import 'package:upc_app/models/service.dart';
import 'package:upc_app/services/firebase_service.dart';
import 'package:upc_app/viewmodels/baseviewmodel.dart';
import 'package:upc_app/widgets/serviceButton.dart';
import 'package:upc_app/widgets/serviceCard.dart';

// ignore: camel_case_types
class MemberView_ViewModel extends BaseViewModel {
  int currIndex = 0;
  FirebaseService _service = locator<FirebaseService>();

  bool? isreg;
  List<Service> servList = [];
  Map<String, bool> regMap = {};
  late Stream _serviceStream;

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
                  // return ServiceButton(
                  //   index: index,
                  //   id: servList[index].id,
                  //   isFull: servList[index].isFull(),
                  //   isRegistered: true,
                  //   availSpace: servList[index].availSp,
                  //   numAttend: servList[index].numAttend,
                  //   servDate: servList[index].serviceDate,
                  //   register: (String id) => register(id, index),
                  // );
                  return x(index);
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

  Widget x(index) {
    return FutureBuilder<bool>(
        //TODO: Remove this and replace with service button
        future: isReg(servList[index]),
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.data != null &&
              snapshot.connectionState == ConnectionState.done) {
            return ServiceButton(
              //TODO: Pass a widget(Future Builder, or streambuilder) to the service button as a button
              index: index,
              id: servList[index].id,
              isFull: servList[index].isFull(),
              isRegistered: snapshot.data!, // TODO implement registered
              availSpace: servList[index].availSp,
              numAttend: servList[index].numAttend,
              servDate: servList[index].serviceDate,
              register: (String id) => register(id, index),
            );
          } else {
            return Container(
              child: Text(
                "Loading",
                style: TextStyle(fontSize: 10),
              ),
            );
          }
        });
  }

  void register(String serviceId, index) async {
    servList[index].register();
    _service.addService(servList[index]);
    Member mem = await getMem();
    _service.registerMemberService(servList[index], mem);
    notifyListeners();
  }

  Future<bool> isReg(Service serv) async {
    Member mem = await getMem();
    bool isregis = await _service.isMemberRegisteredService(serv, mem);
    print(
        "Member registed ${mem.firstName} service ${serv.serviceDate} Isreg $isregis");
    return isregis;
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

  void initialize() {
    _serviceStream = _service.getServices();
  }
}
