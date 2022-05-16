import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceButton extends StatelessWidget {
  ServiceButton(
      {required this.registerButton,
      required this.availSpace,
      required this.numAttend,
      required this.servDate,
      required this.servTime});

  final int numAttend;
  final int availSpace;
  final String servDate;
  final Widget registerButton;
  final String servTime;

  final List<String> picList = [
    "lib/assets/images/alabaster-co-lvZzciLSR0w-unsplash.jpg",
    "lib/assets/images/ServiceButtonImage.jpg",
    "lib/assets/images/matt-botsford-bBNabN9R_ac-unsplash.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                constraints: BoxConstraints(minHeight: 150, minWidth: 100),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(picList[0]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Number of Attendees: $numAttend",
                        style: GoogleFonts.lato(fontSize: 20),
                      ),
                      Text("Available Sapce: $availSpace",
                          style: GoogleFonts.lato(fontSize: 20)),
                      Text("Service Date: $servDate",
                          style: GoogleFonts.lato(fontSize: 20)),
                      Text("Service Time $servTime",
                          style: GoogleFonts.lato(fontSize: 20)),
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: registerButton,
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
