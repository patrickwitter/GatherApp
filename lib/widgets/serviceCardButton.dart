import 'package:flutter/material.dart';
import 'package:upc_app/models/service.dart';
import 'package:upc_app/viewmodels/service_cardbutton_viewmodel.dart';
import 'package:upc_app/views/base_view.dart';

class ServiceCardButton extends StatelessWidget {
  const ServiceCardButton({required this.serv, Key? key}) : super(key: key);
  final Service serv;
  @override
  Widget build(BuildContext context) {
    print("from cardbutton ${serv.availSp}");
    return BaseView<ServiceCardButtonViewModel>(
        onModelReady: (model) => model.initialize(serv: serv),
        builder: (context, model, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                print("from cardbutton2 ${serv.availSp}");
                model.showupdateForm(serv);
              },
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
            ),
          );
        });
  }
}
