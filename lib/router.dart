import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upc_app/models/service.dart';
import 'package:upc_app/views/after_auth/notifcationPage.dart';
import 'package:upc_app/views/pre_auth/mediator_screen_view.dart';
import 'package:upc_app/widgets/serviceForm.dart';
import 'constants/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.mediatorScreen:
      return MaterialPageRoute(builder: (context) => MediatorScreen());
    case Routes.ServiceForm:
      dynamic args = settings.arguments;

      if (args != null) {
        return MaterialPageRoute(
            builder: (context) => ServiceForm(
                  currService: args['service'] as Service,
                ));
      } else {
        return MaterialPageRoute(builder: (context) => ServiceForm());
      }
    case Routes.NotificationPage:
      return MaterialPageRoute(builder: (context) => NotificationsPage());
    default:
      return MaterialPageRoute(builder: (context) => MediatorScreen());
  }
}
