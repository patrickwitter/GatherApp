import 'package:flutter/material.dart';
import 'package:upc_app/viewmodels/member_signup_viewmodel.dart';
import 'package:upc_app/views/base_view.dart';

class MemberSignUp extends StatelessWidget {
  const MemberSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<MemberSignUpViewModel>(builder: (context, model, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Member Sign Up"),
          centerTitle: true,
        ),
        body: Form(
            key: model.formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: model.fNameCtrlr,
                      decoration: InputDecoration(
                        hintText: "Eg. Patrick",
                        labelText: "FirstName",
                        border: OutlineInputBorder(),
                      ),
                    ), //fname
                    TextFormField(
                      controller: model.lNameCtrlr,
                      decoration: InputDecoration(
                        hintText: "Eg.Witter",
                        labelText: "LastName",
                        border: OutlineInputBorder(),
                      ),
                    ), // lname
                    TextFormField(
                      controller: model.addressCtrlr,
                      decoration: InputDecoration(
                        hintText: "Eg.Lot 49 Kale Avenue Spanish Town",
                        labelText: "Address(No ',' or '-')",
                        border: OutlineInputBorder(),
                      ),
                    ), // adress
                    TextFormField(
                      controller: model.phoneNumCtrlr,
                      decoration: InputDecoration(
                        hintText: "Eg.8761234567",
                        labelText: "Phone Number (No '-')",
                        border: OutlineInputBorder(),
                      ),
                    ), // phone
                    TextFormField(
                      controller: model.fNameCtrlr,
                      decoration: InputDecoration(
                        hintText: "Enter Admin Password",
                        labelText: "SignIn as Admin?",
                        border: OutlineInputBorder(),
                      ),
                    ), // admin password

                    Center(
                        child:
                            TextButton(onPressed: () {}, child: Text("Submit")))
                  ],
                ),
              ),
            )),
      );
    });
  }
}
