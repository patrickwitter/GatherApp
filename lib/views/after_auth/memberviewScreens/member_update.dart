import 'package:flutter/material.dart';
import 'package:upc_app/viewmodels/memberview/member_update_viewmodel.dart';
import 'package:upc_app/views/base_view.dart';
import 'package:upc_app/widgets/memberForm.dart';

class UpdateMember extends StatelessWidget {
  const UpdateMember({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<MemberUpdateViewModel>(
        onModelReady: (model) => model.initialize(),
        builder: (context, model, child) {
          return MemberForm(
            formKey: model.formKey,
            addressCtrlr: model.addressCtrlr,
            fNameCtrlr: model.fNameCtrlr,
            lNameCtrlr: model.lNameCtrlr,
            phoneNumCtrlr: model.phoneNumCtrlr,
            isSignUp: model.isSignUp(),
            onSubmit: model.onSubmit,
            validateMode: model.validateMode,
            validateAddress: model.validateAddress,
            validateFName: model.validatefName,
            validateLName: model.validatelName,
            validatePhNum: model.validatePnum,
            onsubmitText: "Update Contact Info",
          );
        });
  }
}
