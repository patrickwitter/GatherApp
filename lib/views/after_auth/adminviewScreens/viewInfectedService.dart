import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:upc_app/models/service.dart';
import 'package:upc_app/viewmodels/adminview/admin_viewinfectedservices_viewmodel.dart';
import 'package:upc_app/views/base_view.dart';
import 'package:upc_app/widgets/infectedServiceCard.dart';

class ViewInfectedServices extends StatelessWidget {
  const ViewInfectedServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<AdminViewInfectedServicesViewModel>(
      onModelReady: (model) => model.initialize(),
      builder: (context, model, child) {
        return StreamBuilder<QuerySnapshot>(
            stream: model.getinfecserviceList,
            builder: (context, snapshot) {
              //print(" snap status ${snapshot.hasData}");
              if (snapshot.hasData) {
                List<Service> servList = model.genserviceList(
                  snapshot.data,
                );
                return ListView.builder(
                    itemCount: servList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InfectedServiceCard(
                        serv: servList[index],
                      );
                    });
              } else if (!snapshot.hasData) {
                return Text("No Infected Services");
              } else {
                return Text("error");
              }
            });
      },
    );
  }
}
