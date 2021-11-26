import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upc_app/constants/routes.dart';
import 'package:upc_app/locator.dart';
import 'package:upc_app/models/service.dart';
import 'package:upc_app/services/firebase_service.dart';
import 'package:upc_app/services/navigation_service.dart';
import 'package:upc_app/viewmodels/baseviewmodel.dart';

class ServiceCardButtonViewModel extends BaseViewModel {
  late Service _serv;
  NavigationService _navserv = locator<NavigationService>();

  void initialize({required Service serv}) {
    _serv = serv;
  }

  void showupdateForm() {
    _navserv.navigateTo(Routes.ServiceForm, arguements: {'service': _serv});
  }
}
