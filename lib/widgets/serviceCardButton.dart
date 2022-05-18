import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upc_app/models/service.dart';
import 'package:upc_app/viewmodels/service_cardbutton_viewmodel.dart';
import 'package:upc_app/views/base_view.dart';

/*
  Used to display service information in a card format and 
  perform an action when tapped 
*/
class ServiceCardButton extends StatelessWidget {
  const ServiceCardButton({required this.serv, Key? key}) : super(key: key);
  final Service serv;
  @override
  Widget build(BuildContext context) {
    return BaseView<ServiceCardButtonViewModel>(
        onModelReady: (model) => model.initialize(serv: serv),
        builder: (context, model, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                model.showupdateForm(serv);
              },
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        constraints:
                            BoxConstraints(minHeight: 150, minWidth: 100),
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Number of Attendees: ${serv.numAttend}",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Text("Available Sapce: ${serv.availSp}",
                              style: Theme.of(context).textTheme.headline5),
                          Text("Service Date: ${serv.serviceDateFormat}",
                              style: Theme.of(context).textTheme.headline5),
                          Text(
                              "Service Time ${serv.serviceTime.format(context)}",
                              style: Theme.of(context).textTheme.headline5),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
