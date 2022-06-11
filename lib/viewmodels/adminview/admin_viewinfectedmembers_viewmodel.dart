import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:upc_app/locator.dart';
import 'package:upc_app/models/member.dart';
import 'package:upc_app/services/firebase_service.dart';
import 'package:upc_app/viewmodels/baseviewmodel.dart';

class AdminViewInfectedMembersViewModel extends BaseViewModel {
  FirebaseService _service = locator<FirebaseService>();

  late Stream<QuerySnapshot<Object?>> infecmemberListStream;

  get getinfecmemberList => infecmemberListStream;

  void initialize() {
    infecmemberListStream = _service.getInfecMembers();
  }

  List<Member> genMemberList(QuerySnapshot<Object?>? data) {
    List<Member> memList = [];
    data!.docs.forEach((doc) {
      Map<String, dynamic> memdata = doc.data() as Map<String, dynamic>;
      memList.add(Member.fromJson(memdata));
    });
    return memList;
  }
}
