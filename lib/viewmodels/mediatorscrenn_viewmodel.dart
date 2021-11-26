import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:upc_app/locator.dart';
import 'package:upc_app/services/firebase_service.dart';
import 'package:upc_app/viewmodels/baseviewmodel.dart';

import 'package:flutter/material.dart';
import 'package:upc_app/views/after_auth/admin_view.dart';
import 'package:upc_app/views/after_auth/member_view.dart';
import 'package:upc_app/views/pre_auth/member_siginIn_view.dart';
import 'package:upc_app/views/pre_auth/member_signupform_view.dart';

class MediatorScreenViewModel extends BaseViewModel {
  final _authinstance = locator<FirebaseAuth>();
  final _firebase = locator<FirebaseService>();

  Widget routeUser(BuildContext context) {
    return StreamBuilder<User?>(
      stream: _authinstance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // Check firebase if user has already signed in. Check for uid
          // return MemberView();
          //return MemberSignUp();
          //return AdminView();
          final String _memuid = _authinstance.currentUser!.uid;
          // return FutureBuilder<bool>(
          //     future: _firebase.isMemberRegistered(_memuid),
          //     builder: (context, futuresnapshot) {
          //       if (snapshot.hasData) {
          //         if (futuresnapshot.data! == true) {
          //           return MemberView();
          //         } else {
          //           return MemberSignUp();
          //         }
          //       } else {
          //         return Container();
          //       }
          //     });
          return _routehelper(
            stream: _firebase.isMemberRegistered(_memuid),
            truePage: _routehelper(
              stream: _firebase.isMemberAdmin(_memuid),
              truePage: AdminView(),
              falsePage: MemberView(),
              defaultPage: Container(),
            ),
            falsePage: MemberSignUp(),
            defaultPage: Container(),
          );
        } else {
          return MemeberSigIn();
        }
      },
    );
  }

  Widget _routehelper({
    required Stream<DocumentSnapshot> stream,
    required Widget truePage,
    required Widget falsePage,
    required Widget defaultPage,
  }) {
    return StreamBuilder<DocumentSnapshot>(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.exists) {
              return truePage;
            } else {
              return falsePage;
            }
          } else {
            return defaultPage;
          }
        });
  }
}
