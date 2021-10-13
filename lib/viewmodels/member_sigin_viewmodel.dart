import 'package:flutter/material.dart';
import 'package:upc_app/locator.dart';
import 'package:upc_app/services/database_service.dart';
import 'package:upc_app/services/firebase_service.dart';
import 'package:upc_app/viewmodels/baseviewmodel.dart';
import 'package:upc_app/views/base_view.dart';
import 'package:upc_app/views/pre_auth/member_siginIn_view.dart';

class MemeberSigInViewModel extends BaseViewModel {
  DataBaseService _service = locator<DataBaseService>();
  void signIn() {
    _service.loginUser();
  }

  void signOut() {
    _service.logoutUser();
  }
}
