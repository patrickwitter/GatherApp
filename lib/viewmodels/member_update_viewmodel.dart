import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:upc_app/locator.dart';
import 'package:upc_app/models/member.dart';
import 'package:upc_app/services/firebase_service.dart';
import 'package:upc_app/viewmodels/baseviewmodel.dart';

class MemberUpdateViewModel extends BaseViewModel {
  FirebaseService _service = locator<FirebaseService>();
  FirebaseAuth _auth = locator<FirebaseAuth>();
  final formKey = GlobalKey<FormState>();
  TextEditingController fNameCtrlr = TextEditingController();
  TextEditingController lNameCtrlr = TextEditingController();
  TextEditingController addressCtrlr = TextEditingController();
  TextEditingController phoneNumCtrlr = TextEditingController();
  Member? _mem;

  bool isSignUp() => false;

  void onSubmit() {
    Member newMem = Member(
      uid: _auth.currentUser!.uid,
      fName: fNameCtrlr.text,
      lName: lNameCtrlr.text,
      pNum: int.parse(phoneNumCtrlr.text),
      address: addressCtrlr.text,
    );
    _service.addMember(newMem);
  }

  initialize() {
    getMem();
  }

  void getMem() async {
    DocumentSnapshot? member = await _service.getMember();
    _mem = Member.fromJson(member.data() as Map<String, dynamic>);
    updateTxtControllers(_mem!);
    notifyListeners();
  }

  void updateTxtControllers(Member member) {
    fNameCtrlr.text = member.firstName;
    lNameCtrlr.text = member.lastName;
    addressCtrlr.text = member.address;
    phoneNumCtrlr.text = member.phoneNum.toString();
  }
}
