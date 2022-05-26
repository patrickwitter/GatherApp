import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:upc_app/models/member.dart';

class MemberCard extends StatelessWidget {
  const MemberCard({required this.mem, Key? key, this.title}) : super(key: key);
  final Member mem;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        elevation: 6,
        child: Container(
          constraints: BoxConstraints(
            minWidth: 100,
            minHeight: 200,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/assets/images/ServiceButtonImage.jpg"),
                fit: BoxFit.cover,
                opacity: .2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Text(
                    title ?? "Member",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(fontSize: 10.sp),
                  ),
                ),
                Text(
                  "FirstName: ${mem.firstName}",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  "LastName: ${mem.lastName},",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  "Address : ${mem.address}",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  "Phone Number: ${mem.phoneNum}",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
