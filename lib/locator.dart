import 'package:get_it/get_it.dart';
import 'package:upc_app/services/database_service.dart';
import 'package:upc_app/services/firebase_service.dart';
import 'package:upc_app/viewmodels/member_sigin_viewmodel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // ViewModels
  locator.registerFactory(() => MemeberSigInViewModel());

  // Services
  locator.registerSingleton<DataBaseService>(FirebaseService());
}
