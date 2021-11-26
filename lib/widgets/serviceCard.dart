import 'package:flutter/material.dart';
import 'package:upc_app/models/service.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({required this.serv, Key? key}) : super(key: key);
  final Service serv;
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
              Text("Number of Attendees: ${serv.numAttend}"),
              Text("Available Sapce: ${serv.availSp}"),
              Text("Service Date: ${serv.serviceDateFormat}"),
              Text("Service Time: ${serv.serviceTime.format(context)}"),
            ],
          ),
        ),
      ),
    );
  }
}
