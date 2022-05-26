import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:upc_app/locator.dart';
import 'package:upc_app/models/notification.dart';

import 'package:upc_app/services/firebase_service.dart';
import 'package:upc_app/viewmodels/baseviewmodel.dart';
import 'package:upc_app/widgets/notificationCard.dart';

import '../widgets/customProgressIndicator.dart';

class NotificationViewViewModel extends BaseViewModel {
  FirebaseService _serv = locator<FirebaseService>();
  Widget getnotifcations() {
    return StreamBuilder<QuerySnapshot>(
        stream: _serv.getNotification(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Notifications> noteList = _noteList(
              snapshot.data,
            );
            return ListView.builder(
                itemCount: noteList.length,
                itemBuilder: (BuildContext context, int index) {
                  return NotificationCard(
                    noti: noteList[index],
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

  List<Notifications> _noteList(QuerySnapshot<Object?>? data) {
    List<Notifications> noteList = [];
    data!.docs.forEach((doc) {
      Map<String, dynamic> notedata = doc.data() as Map<String, dynamic>;
      noteList.add(Notifications.fromJson(notedata));
    });
    return noteList;
  }
}
