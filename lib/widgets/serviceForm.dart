import 'package:flutter/material.dart';
import 'package:upc_app/models/service.dart';

class ServiceForm extends StatelessWidget {
  const ServiceForm({
    Key? key,
    required this.formKey,
    required this.addressCtrlr,
    required this.fNameCtrlr,
    required this.lNameCtrlr,
    required this.phoneNumCtrlr,
    required this.isSignUp,
    this.adminCtrlr,
    required this.onSubmit,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController fNameCtrlr;
  final TextEditingController lNameCtrlr;
  final TextEditingController addressCtrlr;
  final TextEditingController phoneNumCtrlr;
  final TextEditingController? adminCtrlr;
  final bool isSignUp;
  final Function onSubmit;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  controller: fNameCtrlr,
                  decoration: InputDecoration(
                    hintText: "Eg. Patrick",
                    labelText: "FirstName",
                    border: OutlineInputBorder(),
                  ),
                ), //fname
                TextFormField(
                  controller: lNameCtrlr,
                  decoration: InputDecoration(
                    hintText: "Eg.Witter",
                    labelText: "LastName",
                    border: OutlineInputBorder(),
                  ),
                ), // lname
                TextFormField(
                  controller: addressCtrlr,
                  decoration: InputDecoration(
                    hintText: "Eg.Lot 49 Kale Avenue Spanish Town",
                    labelText: "Address(No ',' or '-')",
                    border: OutlineInputBorder(),
                  ),
                ), // adress
                TextFormField(
                  controller: phoneNumCtrlr,
                  decoration: InputDecoration(
                    hintText: "Eg.8761234567",
                    labelText: "Phone Number (No '-')",
                    border: OutlineInputBorder(),
                  ),
                ), // phone
                (isSignUp)
                    ? TextFormField(
                        controller: adminCtrlr,
                        decoration: InputDecoration(
                          hintText: "Enter Admin Password",
                          labelText: "SignIn as Admin?",
                          border: OutlineInputBorder(),
                        ),
                      )
                    : Container(), // admin password
                Center(
                    child: TextButton(
                        onPressed: () {
                          onSubmit();
                        },
                        child: Text("Submit")))
              ],
            ),
          ),
        ));
  }
}
