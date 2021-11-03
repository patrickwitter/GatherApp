import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:upc_app/constants/collections_docs.dart';
import 'package:upc_app/locator.dart';
import 'package:upc_app/models/member.dart';
import 'package:upc_app/models/service.dart';
import 'package:upc_app/services/firebase_service.dart';
import 'package:upc_app/viewmodels/baseviewmodel.dart';

class MemberView_ViewModel extends BaseViewModel {
  int currIndex = 0;
  FirebaseService _service = locator<FirebaseService>();
  final f = locator<FirebaseFirestore>();

  void updateTabIndex(int newindex) {
    currIndex = newindex;
    notifyListeners();
  }

  bool isHome() {
    return currIndex == 0;
  }

  Widget availableServicesList() {
    return StreamBuilder<QuerySnapshot>(
        stream: _service.getServices(),
        builder: (context, snapshot) {
          print(" snap status ${snapshot.hasData}");
          if (snapshot.hasData) {
            Map<String, dynamic> data =
                snapshot.data!.docs[0].data()! as Map<String, dynamic>;
            Service serv = Service.fromJson(data);
            return Text("Data ${serv.isopen}");
          } else if (!snapshot.hasData) {
            return Text("No data");
          } else {
            return Text("error");
          }
        });
  }

  void addMember() {
    _service.addMember(Member(
        uid: "1", fName: "love", lName: "less", pNum: 12, address: "Lot 49"));
  }

  void addService() {
    _service.addService(
        Service(serviceDt: DateTime.now(), isOpen: false, availSpace: 100));
  }
}
