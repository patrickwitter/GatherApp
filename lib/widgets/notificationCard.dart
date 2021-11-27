import 'package:flutter/material.dart';
import 'package:upc_app/models/notification.dart';
import 'package:upc_app/models/service.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({required this.noti, Key? key}) : super(key: key);
  final Notifications noti;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 200,
        height: 200,
        color: Colors.blue[100],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [Text("Notifcation sent: ${noti.notificDateFormat}")],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              Text("${noti.notificationTxt}"),
            ],
          ),
        ),
      ),
    );
  }
}
