import 'package:flutter/cupertino.dart';
import 'package:upc_app/viewmodels/baseviewmodel.dart';

class MemberSignUpViewModel extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  TextEditingController fNameCtrlr = TextEditingController();
  TextEditingController lNameCtrlr = TextEditingController();
  TextEditingController addressCtrlr = TextEditingController();
  TextEditingController phoneNumCtrlr = TextEditingController();
  TextEditingController adminPasCtrlrs = TextEditingController();
}
