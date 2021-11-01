import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upc_app/views/pre_auth/admin_signin_view.dart';
import 'package:upc_app/views/pre_auth/mediator_screen_view.dart';
import 'constants/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.mediatorScreen:
      return MaterialPageRoute(builder: (context) => MediatorScreen());
    case Routes.adminSignIn:
      return MaterialPageRoute(builder: (context) => AdminSignIn());
    default:
      return MaterialPageRoute(builder: (context) => AdminSignIn());
  }
}
