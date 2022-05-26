import 'package:flutter/material.dart';

import 'package:upc_app/viewmodels/notificationView_viewmodel.dart';
import 'package:upc_app/views/base_view.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<NotificationViewViewModel>(
        builder: (context, model, child) {
      return Scaffold(
        appBar: AppBar(
          iconTheme:
              IconThemeData(color: Theme.of(context).colorScheme.onSurface),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            "Notifcations",
            style: Theme.of(context).textTheme.headline4,
          ),
          centerTitle: true,
        ),
        body: model.getnotifcations(),
      );
    });
  }
}
