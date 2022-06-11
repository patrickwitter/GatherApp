import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:upc_app/locator.dart';
import 'package:upc_app/services/firebase_service.dart';
import 'package:upc_app/viewmodels/baseviewmodel.dart';

class MemeberAlertViewModel extends BaseViewModel {
  FirebaseService _service = locator<FirebaseService>();

  late Stream<QuerySnapshot<Object?>> _getAlerts;

  get getAlerts => _getAlerts;

  void initialize() {
    _getAlerts = _service.getMembers();
  }
}
