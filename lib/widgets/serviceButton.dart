import 'package:flutter/material.dart';

class ServiceButton extends StatelessWidget {
  const ServiceButton({
    required this.id,
    required this.isFull,
    required this.isRegistered,
    required this.availSpace,
    required this.numAttend,
    required this.servDate,
    required this.register,
    required this.index,
  });
  final int index;
  final String id;
  final bool isFull;
  final int numAttend;
  final int availSpace;
  final String servDate;
  final bool isRegistered;
  final Function(String) register;

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
              ElevatedButton(
                  //TODO: Take out logic
                  onPressed:
                      (!isFull && !isRegistered) ? () => register(id) : null,
                  child: Text((!isFull && !isRegistered)
                      ? "Register"
                      : (isFull)
                          ? "Full"
                          : "Registered"))
            ],
          ),
        ),
      ),
    );
  }
}
