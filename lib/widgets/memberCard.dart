import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upc_app/models/member.dart';

class MemberCard extends StatelessWidget {
  const MemberCard({required this.mem, Key? key}) : super(key: key);
  final Member mem;
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
                Center(child: Text("Member")),
                Text(
                  "FirstName: ${mem.firstName}",
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "LastName: ${mem.lastName},",
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Address : ${mem.address}",
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Phone Number: ${mem.phoneNum}",
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
