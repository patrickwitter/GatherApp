import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:upc_app/locator.dart';
import 'package:upc_app/models/member.dart';
import 'package:upc_app/services/firebase_service.dart';
import 'package:upc_app/services/navigation_service.dart';
import 'package:upc_app/services/validation_service.dart';
import 'package:upc_app/viewmodels/baseviewmodel.dart';

class MemberUpdateViewModel extends BaseViewModel {
  FirebaseService _service = locator<FirebaseService>();
  FirebaseAuth _auth = locator<FirebaseAuth>();
  NavigationService _navServ = locator<NavigationService>();
  final formKey = GlobalKey<FormState>();
  TextEditingController fNameCtrlr = TextEditingController();
  TextEditingController lNameCtrlr = TextEditingController();
  TextEditingController addressCtrlr = TextEditingController();
  TextEditingController phoneNumCtrlr = TextEditingController();
  Member? _mem;
  bool isSignUp() => false;
  ValidationService _valserv = locator<ValidationService>();

  AutovalidateMode validateMode = AutovalidateMode.disabled;

  void onSubmit() {
    validateMode = AutovalidateMode.always;
    if (formKey.currentState!.validate()) {
      validateMode = AutovalidateMode.disabled;
      Member newMem = Member(
        uid: _auth.currentUser!.uid,
        fName: fNameCtrlr.text,
        lName: lNameCtrlr.text,
        pNum: int.parse(phoneNumCtrlr.text),
        address: addressCtrlr.text,
      );

      _service.addMember(newMem);
      _navServ.showSnackBar(" Information was updated Successfully");
    }
  }

  initialize() {
    getMem();
  }

  void getMem() async {
    DocumentSnapshot? member = await _service.getMember();
    if (member.data() != null) {
      _mem = Member.fromJson(member.data() as Map<String, dynamic>);
      _updateTxtControllers(_mem!);
      notifyListeners();
    }
  }

  void _updateTxtControllers(Member member) {
    fNameCtrlr.text = member.firstName;
    lNameCtrlr.text = member.lastName;
    addressCtrlr.text = member.address;
    phoneNumCtrlr.text = member.phoneNum.toString();
  }

  String? validatefName(String? fName) {
    print("updateview");
    final String? err = _valserv.validateFirstLastName(fName!);
    return err;
  }

  String? validatelName(String? lName) {
    print("updateview");
    final String? err = _valserv.validateFirstLastName(lName!);
    return err;
  }

  String? validatePnum(String? pnum) {
    final String? err = _valserv.validateNum(pnum!);
    return err;
  }

  String? validateAddress(String? address) {
    final String? err = _valserv.validateAplhaNum(address!);
    return err;
  }

  @override
  void dispose() {
    fNameCtrlr.dispose();
    lNameCtrlr.dispose();
    addressCtrlr.dispose();
    phoneNumCtrlr.dispose();
    super.dispose();
  }
}
