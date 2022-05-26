import 'package:flutter/material.dart';

import 'package:upc_app/models/notification.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({required this.noti, Key? key}) : super(key: key);
  final Notifications noti;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        color: Theme.of(context).cardColor,
        elevation: 6,
        child: Container(
          constraints: BoxConstraints(
            minWidth: 100,
            minHeight: 100,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/assets/images/SignInImage.jpg"),
                fit: BoxFit.cover,
                opacity: .4),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Notifcation sent: ${noti.notificDateFormat}",
                  style: Theme.of(context).textTheme.caption,
                ),
                SizedBox(
                  height: 40,
                ),
                Text("${noti.notificationTxt}",
                    style: Theme.of(context).textTheme.headline6),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
