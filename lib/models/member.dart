import 'package:upc_app/constants/member_jsonKey.dart';

class Member {
  late String _uid;
  late String _firstName;
  late String _lastName;
  late int _phoneNum;
  late String _address;

  Member(
      {required String uid,
      required String fName,
      required String lName,
      required int pNum,
      required String address}) {
    this._uid = uid;
    this._firstName = fName;
    this._lastName = lName;
    this._phoneNum = pNum;
    this._address = address;
  }

  String get uid => this._uid;

  factory Member.fromJson(Map<String, dynamic> json) => Member(
      uid: json[MemberKey.uid],
      fName: json[MemberKey.fname],
      lName: json[MemberKey.lname],
      pNum: int.parse(json[MemberKey.pNum]),
      address: json[MemberKey.address]);

  Map<String, dynamic> toJson() {
    return {
      MemberKey.fname: this._firstName,
      MemberKey.lname: this._lastName,
      MemberKey.uid: this._uid,
      MemberKey.pNum: this._phoneNum.toString(),
      MemberKey.address: this._address,
    };
  }
}
