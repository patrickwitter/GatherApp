import 'package:flutter/material.dart';
import 'package:upc_app/widgets/custom_textfield.dart';

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
    this.onsubmitText,
  }) : super(key: key);

  final String? onsubmitText;
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
              CustomTextField(
                ctrlr: fNameCtrlr,
                hintString: "Eg. Patrick",
                labelString: "FirstName",
                validateFunc: (value) => this.validateFName(value),
              ),
              //fname
              CustomTextField(
                ctrlr: this.lNameCtrlr,
                hintString: "Eg.Witter",
                labelString: "LastName",
                validateFunc: (value) => this.validateLName(value),
              ), // lname
              CustomTextField(
                ctrlr: addressCtrlr,
                hintString: "Eg.Lot 49 Kale Avenue Spanish Town",
                labelString: "Address(No ',' or '-')",
                validateFunc: (value) => this.validateAddress(value),
              ), // adress

              CustomTextField(
                ctrlr: phoneNumCtrlr,
                validateFunc: (value) => validatePhNum(value),
                hintString: "Eg.8761234567",
                labelString: "Phone Number (No '-')",
              ), // phone
              (isSignUp)
                  ? CustomTextField(
                      ctrlr: adminCtrlr,
                      hintString: "SignIn as Admin?",
                      labelString: "Enter Admin Password",
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
                          color: Theme.of(context).iconTheme.color!,
                        ),
                        primary: Theme.of(context).iconTheme.color),
                    child: Text(
                      onsubmitText ?? "Submit",
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).iconTheme.color!,
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
