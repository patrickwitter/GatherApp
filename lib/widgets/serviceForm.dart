import 'package:flutter/material.dart';
import 'package:upc_app/models/service.dart';
import 'package:upc_app/viewmodels/serviceform_viewmodel.dart';
import 'package:upc_app/views/base_view.dart';

class ServiceForm extends StatelessWidget {
  const ServiceForm({
    Key? key,
    this.currService,
  }) : super(key: key);

  final Service? currService;
  @override
  Widget build(BuildContext context) {
    return BaseView<ServiceFormViewModel>(
      onModelReady: (model) =>
          model.initialize(this.currService, context: context),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(model.title),
            centerTitle: true,
          ),
          body: Form(
              key: model.formkey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: model.availSpaceCtrl,
                        decoration: InputDecoration(
                          hintText: "50",
                          labelText: "Set Max Attendees",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => model.pickDate(context),
                        child: Text(model.dateText),
                      ),
                      ElevatedButton(
                        onPressed: () => model.pickTime(context),
                        child: Text(model.timeText),
                      ),
                      Center(
                          child: TextButton(
                              onPressed: () {
                                model.submitServiceForm();
                              },
                              child: Text("Submit")))
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }
}
