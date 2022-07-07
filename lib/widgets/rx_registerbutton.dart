import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:upc_app/models/service.dart';
import 'package:upc_app/widgets/customProgressIndicator.dart';
import 'package:upc_app/widgets/registerButton.dart';

class RxRegisterButton extends StatelessWidget {
  const RxRegisterButton(
      {required this.stream,
      required this.actionNotRegistered,
      required this.actionRegistered,
      required this.serv,
      this.full = "Full",
      this.hasRegistered = "UnRegister",
      this.notRegsitered = "Register",
      Key? key})
      : super(key: key);

  final String hasRegistered;
  final String notRegsitered;
  final String full;
  final Stream<DocumentSnapshot<Object?>>? stream;
  final Function() actionNotRegistered;
  final Function() actionRegistered;
  final Service serv;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.exists) {
            return RegisterButton(
              text: hasRegistered,
              action: actionRegistered,
              color: Colors.red[100],
            );
          } else if (snapshot.hasData && !snapshot.data!.exists) {
            if (!serv.isFull()) {
              return RegisterButton(
                action: actionNotRegistered,
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
