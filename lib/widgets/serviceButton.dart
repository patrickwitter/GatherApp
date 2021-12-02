import 'package:flutter/material.dart';

class ServiceButton extends StatelessWidget {
  const ServiceButton(
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
                children: [Text("Service")],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              Text("Number of Attendees: $numAttend"),
              Text("Available Sapce: $availSpace"),
              Text("Service Date: $servDate"),
              Text("Service Time $servTime"),
              registerButton
            ],
          ),
        ),
      ),
    );
  }
}
