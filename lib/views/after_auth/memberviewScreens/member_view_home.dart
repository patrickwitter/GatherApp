import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:upc_app/models/service.dart';
import 'package:upc_app/viewmodels/memberview/member_home_viewmodel.dart';
import 'package:upc_app/views/base_view.dart';
import 'package:upc_app/widgets/customProgressIndicator.dart';
import 'package:upc_app/widgets/rx_registerbutton.dart';
import 'package:upc_app/widgets/serviceRegisterCard.dart';

class MemberHome extends StatelessWidget {
  const MemberHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<MemberHomeViewModel>(
        onModelReady: (model) => model.initialize(),
        builder: (context, model, child) {
          return FutureBuilder(
              future: model.initMember(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return StreamBuilder<QuerySnapshot>(
                      stream: model.serviceInfo,
                      builder: (context, snapshot) {
                        // print(" snap status ${snapshot.hasData}");
                        if (snapshot.hasData) {
                          List<Service> servList;
                          servList = model.getServiceList(
                            snapshot.data,
                          );
                          return ListView.builder(
                              itemCount: servList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ServiceRegisterCard(
                                  registerButton: RxRegisterButton(
                                    stream: model.isMemberRegistered(
                                      serv: servList[index],
                                    ),
                                    actionNotRegistered: () =>
                                        model.register(servList[index]),
                                    serv: servList[index],
                                    actionRegistered: () =>
                                        model.unregister(servList[index]),
                                  ),
                                  availSpace: servList[index].availSp,
                                  numAttend: servList[index].numAttend,
                                  servDate: servList[index].serviceDateFormat,
                                  servTime: servList[index]
                                      .serviceTime
                                      .format(context),
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
                } else {
                  return Center(
                    child: CustomCircularProgressIndicator(),
                  );
                }
              });
        });
  }
}
