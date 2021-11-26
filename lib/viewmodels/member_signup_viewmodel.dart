import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:upc_app/locator.dart';
import 'package:upc_app/models/member.dart';
import 'package:upc_app/services/firebase_service.dart';
import 'package:upc_app/viewmodels/baseviewmodel.dart';

class MemberSignUpViewModel extends BaseViewModel {
  FirebaseService _service = locator<FirebaseService>();
  FirebaseAuth _auth = locator<FirebaseAuth>();
  final formKey = GlobalKey<FormState>();
  TextEditingController fNameCtrlr = TextEditingController();
  TextEditingController lNameCtrlr = TextEditingController();
  TextEditingController addressCtrlr = TextEditingController();
  TextEditingController phoneNumCtrlr = TextEditingController();
  TextEditingController adminPasCtrlrs = TextEditingController();

  bool isSignUp() => true;

  void onSubmit() async {
    Member newMem = Member(
      uid: _auth.currentUser!.uid,
      fName: fNameCtrlr.text,
      lName: lNameCtrlr.text,
      pNum: int.parse(phoneNumCtrlr.text),
      address: addressCtrlr.text,
    );

    await addAsAdmin(newMem);
    addAsMem(newMem);
  }

  void addAsMem(Member mem) {
    _service.addMember(mem);
  }

  Future<void> addAsAdmin(Member mem) async {
    print("tried admin");
    print("Password entered ${adminPasCtrlrs.text}");
    if (adminPasCtrlrs.text != "") {
      print("Password entered ${adminPasCtrlrs.text}");
      bool isAdmin = await _service.verifyPassword(adminPasCtrlrs.text);
      print("is member admin $isAdmin");
      if (isAdmin) {
        _service.addAdmin(mem);
      }
    }
  }
}
