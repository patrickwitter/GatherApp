import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:upc_app/models/alerts.dart';
import 'package:upc_app/viewmodels/memberview/memberalert_viewmodel.dart';
import 'package:upc_app/views/base_view.dart';
import 'package:upc_app/views/error_widget.dart';

class MemberAlerts extends StatelessWidget {
  const MemberAlerts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<MemeberAlertViewModel>(
        onModelReady: (model) => model.initialize(),
        builder: (context, model, child) {
          return StreamBuilder<DocumentSnapshot>(
            stream: model.getAlerts,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                CovidAlert.fromJson(
                    snapshot.data!.data() as Map<String, dynamic>);
                return Center(
                  child: Text(
                    "Covid Alerts Sent: ${CovidAlert.numAlerts}",
                  ),
                );
              } else if (snapshot.hasError) {
                return CustomErrorWidget(
                  errordetails: "An error has occured ${snapshot.error}",
                );
              } else {
                return Center(
                  child: Text(
                    "No Alerts",
                    style: Theme.of(context).textTheme.caption,
                  ),
                );
              }
            },
          );
        });
  }
}
