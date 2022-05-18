import 'package:flutter/material.dart';

class MemberForm extends StatelessWidget {
  const MemberForm({
    Key? key,
    required this.formKey,
    required this.addressCtrlr,
    required this.fNameCtrlr,
    required this.lNameCtrlr,
    required this.phoneNumCtrlr,
    required this.isSignUp,
    this.adminCtrlr,
    required this.validateMode,
    required this.validateFName,
    required this.validateAddress,
    required this.validateLName,
    required this.validatePhNum,
    required this.onSubmit,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController fNameCtrlr;
  final TextEditingController lNameCtrlr;
  final TextEditingController addressCtrlr;
  final TextEditingController phoneNumCtrlr;
  final TextEditingController? adminCtrlr;
  final AutovalidateMode? validateMode;
  final bool isSignUp;
  final Function onSubmit;
  final String? Function(String?) validateFName;
  final String? Function(String?) validateLName;
  final String? Function(String?) validateAddress;
  final String? Function(String?) validatePhNum;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: validateMode ?? AutovalidateMode.disabled,
      key: formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: fNameCtrlr,
                  style: Theme.of(context).textTheme.headline5,
                  decoration: InputDecoration(
                    hintText: "Eg. Patrick",
                    labelText: "FirstName",
                    border: OutlineInputBorder(),
                  ),
                  validator: this.validateFName,
                ),
              ), //fname
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: Theme.of(context).textTheme.headline5,
                  controller: lNameCtrlr,
                  decoration: InputDecoration(
                    hintText: "Eg.Witter",
                    labelText: "LastName",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => this.validateLName(value),
                ),
              ), // lname
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: Theme.of(context).textTheme.headline5,
                  controller: addressCtrlr,
                  decoration: InputDecoration(
                    hintText: "Eg.Lot 49 Kale Avenue Spanish Town",
                    labelText: "Address(No ',' or '-')",
                    border: OutlineInputBorder(),
                  ),
                  validator: this.validateAddress,
                ),
              ), // adress
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: Theme.of(context).textTheme.headline5,
                  controller: phoneNumCtrlr,
                  decoration: InputDecoration(
                    hintText: "Eg.8761234567",
                    labelText: "Phone Number (No '-')",
                    border: OutlineInputBorder(),
                  ),
                  validator: this.validatePhNum,
                ),
              ), // phone
              (isSignUp)
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        style: Theme.of(context).textTheme.headline5,
                        controller: adminCtrlr,
                        decoration: InputDecoration(
                          hintText: "Enter Admin Password",
                          labelText: "SignIn as Admin?",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    )
                  : Container(), // admin password
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      onSubmit();
                    },
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
    );
  }
}
