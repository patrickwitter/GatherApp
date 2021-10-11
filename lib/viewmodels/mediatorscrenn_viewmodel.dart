import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:upc_app/viewmodels/baseviewmodel.dart';

import 'package:flutter/material.dart';
import 'package:upc_app/views/after_auth/member_view.dart';
import 'package:upc_app/views/pre_auth/member_siginIn_view.dart';

class MediatorScreenViewModel extends BaseViewModel {
  StreamController<int> controller = StreamController();

  Widget routeUser(BuildContext context) {
    controller.add(12);
    return StreamBuilder(
      stream: controller.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data == 12) {
            return MemeberSigIn();
          } else {
            return MemeberView();
          }
        } else {
          return Container();
        }
      },
    );
  }
}
