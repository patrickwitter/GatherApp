import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:upc_app/models/member.dart';
import 'package:upc_app/viewmodels/adminview/admin_viewinfectedmembers_viewmodel.dart';
import 'package:upc_app/views/base_view.dart';
import 'package:upc_app/widgets/memberCard.dart';

class ViewInfecMembers extends StatelessWidget {
  const ViewInfecMembers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<AdminViewInfectedMembersViewModel>(
      onModelReady: (model) => model.initialize(),
      builder: (context, model, child) {
        return StreamBuilder<QuerySnapshot>(
            stream: model.getinfecmemberList,
            builder: (context, snapshot) {
              //print(" snap status ${snapshot.hasData}");
              if (snapshot.hasData) {
                List<Member> memList = model.genMemberList(
                  snapshot.data,
                );
                return ListView.builder(
                    itemCount: memList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return MemberCard(
                        mem: memList[index],
                      );
                    });
              } else if (!snapshot.hasData) {
                return Text("No Infected Members");
              } else {
                return Text("error");
              }
            });
      },
    );
  }
}
