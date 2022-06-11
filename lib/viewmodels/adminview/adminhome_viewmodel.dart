import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:upc_app/locator.dart';
import 'package:upc_app/models/service.dart';
import 'package:upc_app/services/firebase_service.dart';
import 'package:upc_app/viewmodels/baseviewmodel.dart';

class AdminHomeViewModel extends BaseViewModel {
  FirebaseService _service = locator<FirebaseService>();
  late Stream<QuerySnapshot<Object?>> _availservices;

  get getServiceList => _availservices;

  void initialize() {
    _availservices = _service.getServices();
  }

  List<Service> genServiceList(QuerySnapshot<Object?>? data) {
    List<Service> servList = [];
    data!.docs.forEach((doc) {
      Map<String, dynamic> servdata = doc.data() as Map<String, dynamic>;
      servList.add(Service.fromJson(servdata));
    });
    return servList;
  }
}
