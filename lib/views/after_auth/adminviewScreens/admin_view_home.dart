import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:upc_app/models/service.dart';
import 'package:upc_app/viewmodels/adminview/adminhome_viewmodel.dart';
import 'package:upc_app/views/base_view.dart';
import 'package:upc_app/widgets/customProgressIndicator.dart';
import 'package:upc_app/widgets/serviceCardButton.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<AdminHomeViewModel>(
        onModelReady: (model) => model.initialize(),
        builder: (context, model, child) {
          return StreamBuilder<QuerySnapshot>(
              stream: model.getServiceList,
              builder: (context, snapshot) {
                // print(" snap status ${snapshot.hasData}");
                if (snapshot.hasData) {
                  List<Service> servList = model.genServiceList(
                    snapshot.data,
                  );
                  return ListView.builder(
                      itemCount: servList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ServiceCardButton(
                          serv: servList[index],
                        );
                      });
                } else if (!snapshot.hasData) {
                  return Center(
                    child: CustomCircularProgressIndicator(),
                  );
                } else {
                  return Text("error");
                }
              });
        });
  }
}
