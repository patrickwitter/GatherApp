import 'package:flutter/material.dart';
import 'package:upc_app/models/member.dart';

class MemberCard extends StatelessWidget {
  const MemberCard({required this.mem, Key? key}) : super(key: key);
  final Member mem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 200,
        height: 200,
        color: Colors.blue[100],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [Text("Member")],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              Text("FirstName: ${mem.firstName}"),
              Text("LastName: ${mem.lastName}"),
              Text("Address : ${mem.address}"),
              Text("Phone Number: ${mem.phoneNum}"),
            ],
          ),
        ),
      ),
    );
  }
}
