import 'package:flutter/material.dart';
import 'package:upc_app/models/service.dart';
import 'package:upc_app/viewmodels/serviceform_viewmodel.dart';
import 'package:upc_app/views/base_view.dart';

class ServiceForm extends StatelessWidget {
  const ServiceForm({
    Key? key,
    Service? currService,
  }) : super(key: key);

  // final GlobalKey<FormState> formKey;
  // final TextEditingController fNameCtrlr;
  // final TextEditingController lNameCtrlr;
  // final TextEditingController addressCtrlr;
  // final TextEditingController phoneNumCtrlr;
  // final TextEditingController? adminCtrlr;
  // final bool isSignUp;
  // final Function onSubmit;

  @override
  Widget build(BuildContext context) {
    return BaseView<ServiceFormViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Create Service"),
            centerTitle: true,
          ),
          body: Form(
              // key: formKey,
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: model.numAttendCtrl,
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
