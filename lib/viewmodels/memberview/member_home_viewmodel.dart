import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:upc_app/locator.dart';
import 'package:upc_app/models/member.dart';
import 'package:upc_app/models/service.dart';
import 'package:upc_app/services/firebase_service.dart';
import 'package:upc_app/viewmodels/baseviewmodel.dart';

class MemberHomeViewModel extends BaseViewModel {
  FirebaseService _service = locator<FirebaseService>();

  late Stream _serviceStream;
  late Member _member;
  late Stream ismemberRegisteredStream;

  get serviceInfo => _serviceStream as Stream<QuerySnapshot<Object?>>;
  get member => _member;

  void initialize() async {
    _serviceStream = _service.getServices();
    _member = await getMem();
  }

  Future<Member> getMem() async {
    DocumentSnapshot doc = await _service.getMember();
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    Member mem = Member.fromJson(data);

    return mem;
  }

  List<Service> getServiceList(QuerySnapshot<Object?>? data) {
    List<Service> servList = [];
    data!.docs.forEach((doc) {
      Map<String, dynamic> servdata = doc.data() as Map<String, dynamic>;
      servList.add(Service.fromJson(servdata));
    });
    return servList;
  }

  Stream<DocumentSnapshot<Object?>>? isMemberRegistered(
      {required Service serv}) {
    return _service.isMemberRegisteredService(serv, _member);
  }

  void register(Service serv) async {
    serv.register();
    _service.updateNumSpaces(serv);
    _service.registerMemberService(serv, _member);
  }

  void unregister(Service serv) async {
    serv.unregister();
    _service.updateNumSpaces(serv);
    _service.unregisterMemberService(serv, _member);
  }
}
