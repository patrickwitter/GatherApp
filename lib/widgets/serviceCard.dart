import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upc_app/models/service.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({required this.serv, Key? key}) : super(key: key);
  final Service serv;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                constraints: BoxConstraints(minHeight: 150, minWidth: 100),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(
                        "lib/assets/images/alabaster-co-lvZzciLSR0w-unsplash.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [Text("Infected Service")],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  Text("Number of Attendees: ${serv.numAttend}",
                      style: GoogleFonts.lato(fontSize: 20)),
                  Text("Available Sapce: ${serv.availSp}",
                      style: GoogleFonts.lato(fontSize: 20)),
                  Text("Service Date: ${serv.serviceDateFormat}",
                      style: GoogleFonts.lato(fontSize: 20)),
                  Text("Service Time: ${serv.serviceTime.format(context)}",
                      style: GoogleFonts.lato(fontSize: 20)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
