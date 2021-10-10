import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upc_app/views/admin_signin_view.dart';
import 'constants/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  //return MaterialPageRoute(builder: (context) => Container());

  switch (settings.name) {
    case Routes.adminSignIn:
      return MaterialPageRoute(builder: (context) => AdminSignIn());
    default:
      return MaterialPageRoute(builder: (context) => AdminSignIn());
  }
}
