import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:upc_app/locator.dart';
import 'package:upc_app/models/service.dart';
import 'package:upc_app/viewmodels/baseviewmodel.dart';

import '../../services/firebase_service.dart';

class AdminViewInfectedServicesViewModel extends BaseViewModel {
  FirebaseService _service = locator<FirebaseService>();

  late Stream<QuerySnapshot<Object?>> infecserviceListStream;

  get getinfecserviceList => infecserviceListStream;

  void initialize() {
    infecserviceListStream = _service.getInfecServices();
  }

  List<Service> genserviceList(QuerySnapshot<Object?>? data) {
    List<Service> servList = [];
    data!.docs.forEach((doc) {
      Map<String, dynamic> servdata = doc.data() as Map<String, dynamic>;
      servList.add(Service.fromJson(servdata));
    });
    return servList;
  }
}
