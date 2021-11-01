import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:upc_app/locator.dart';
import 'package:upc_app/viewmodels/baseviewmodel.dart';

import 'package:flutter/material.dart';
import 'package:upc_app/views/after_auth/member_view.dart';
import 'package:upc_app/views/pre_auth/member_siginIn_view.dart';

class MediatorScreenViewModel extends BaseViewModel {
  final _authinstance = locator<FirebaseAuth>();

  Widget routeUser(BuildContext context) {
    return StreamBuilder<User?>(
      stream: _authinstance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // Check firebase if user has already signed in. Check for uid
          return MemeberView();
        } else {
          return MemeberSigIn();
        }
      },
    );
  }
}
