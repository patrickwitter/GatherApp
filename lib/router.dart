import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upc_app/views/pre_auth/mediator_screen_view.dart';
import 'package:upc_app/widgets/serviceForm.dart';
import 'constants/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.mediatorScreen:
      return MaterialPageRoute(builder: (context) => MediatorScreen());
    case Routes.ServiceForm:
      dynamic arg = settings.arguments;
      return MaterialPageRoute(builder: (context) => ServiceForm());
    default:
      return MaterialPageRoute(builder: (context) => MediatorScreen());
  }
}
