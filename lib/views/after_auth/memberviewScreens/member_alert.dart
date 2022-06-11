import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:upc_app/viewmodels/memberview/memberalert_viewmodel.dart';
import 'package:upc_app/views/base_view.dart';

class MemberAlerts extends StatelessWidget {
  const MemberAlerts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<MemeberAlertViewModel>(
        onModelReady: (model) => model.initialize(),
        builder: (context, model, child) {
          return StreamBuilder<QuerySnapshot>(
            stream: model.getAlerts,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print("has data");
                print("${snapshot.data!.docs.length}");
                return Text("has data ");
              } else if (snapshot.hasError) {
                print("error data \n ${snapshot.error}");

                return Text(" error data");
              } else {
                return Center(
                  child: Text(
                    "Alerts",
                    style: Theme.of(context).textTheme.caption,
                  ),
                );
              }
            },
          );
        });
  }
}
