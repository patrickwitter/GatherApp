import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:upc_app/models/service.dart';
import 'package:upc_app/widgets/customProgressIndicator.dart';
import 'package:upc_app/widgets/registerButton.dart';

class RxRegisterButton extends StatelessWidget {
  const RxRegisterButton(
      {required this.stream,
      required this.action,
      required this.serv,
      this.full = "Full",
      this.hasRegistered = "Registered",
      this.notRegsitered = "Register",
      Key? key})
      : super(key: key);

  final String hasRegistered;
  final String notRegsitered;
  final String full;
  final Stream<DocumentSnapshot<Object?>>? stream;
  final Function() action;
  final Service serv;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.exists) {
            return RegisterButton(text: hasRegistered);
          } else if (snapshot.hasData && !snapshot.data!.exists) {
            if (!serv.isFull()) {
              return RegisterButton(
                action: action,
                text: notRegsitered,
              );
            } else {
              return RegisterButton(text: full);
            }
          } else {
            return CustomCircularProgressIndicator();
          }
        });
  }
}
