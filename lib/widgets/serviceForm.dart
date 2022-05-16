import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Color(0xFFf8f8f8),
            title: Text(
              model.title,
              style: GoogleFonts.lato(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
                key: model.formKey,
                autovalidateMode: model.validateMode,
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
                          validator: (value) => model.validateSpace(value),
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
          ),
        );
      },
    );
  }
}
