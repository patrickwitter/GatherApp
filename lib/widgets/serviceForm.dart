import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upc_app/models/service.dart';
import 'package:upc_app/viewmodels/serviceform_viewmodel.dart';
import 'package:upc_app/views/base_view.dart';
import 'package:upc_app/widgets/custom_textfield.dart';
import 'package:upc_app/widgets/optionButton.dart';

/*
Used to enter details when a service is to be created or updated 
*/

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
                      CustomTextField(
                        ctrlr: model.availSpaceCtrl,
                        hintString: "50",
                        labelString: "Set Max Attendees",
                        validateFunc: (val) => model.validateSpace(val),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      OptionButton(
                        action: () => model.pickDate(context),
                        child: Text(
                          model.dateText,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                      OptionButton(
                        action: () => model.pickTime(context),
                        child: Text(
                          model.timeText,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Center(
                          child: TextButton(
                            onPressed: () => model.submitServiceForm(),
                            style: TextButton.styleFrom(
                                minimumSize: Size(200, 50),
                                side: BorderSide(
                                  style: BorderStyle.solid,
                                  color: Colors.blue,
                                ),
                                primary: Theme.of(context).iconTheme.color),
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
