import 'package:flutter/material.dart';
import 'package:upc_app/viewmodels/member_signup_viewmodel.dart';
import 'package:upc_app/views/base_view.dart';
import 'package:upc_app/widgets/memberForm.dart';

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
        body: MemberForm(
          formKey: model.formKey,
          addressCtrlr: model.addressCtrlr,
          fNameCtrlr: model.fNameCtrlr,
          lNameCtrlr: model.lNameCtrlr,
          phoneNumCtrlr: model.phoneNumCtrlr,
          adminCtrlr: model.adminPasCtrlrs,
          isSignUp: model.isSignUp(),
          onSubmit: model.onSubmit,
        ),
      );
    });
  }
}
