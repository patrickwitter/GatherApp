import 'package:upc_app/locator.dart';
import 'package:upc_app/services/firebase_service.dart';
import 'package:upc_app/viewmodels/baseviewmodel.dart';

class MemeberSigInViewModel extends BaseViewModel {
  FirebaseService _service = locator<FirebaseService>();
  void signIn() {
    _service.loginUser();
  }
}
