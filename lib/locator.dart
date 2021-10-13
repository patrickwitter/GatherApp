import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:upc_app/services/database_service.dart';
import 'package:upc_app/services/firebase_service.dart';
import 'package:upc_app/services/navigation_service.dart';
import 'package:upc_app/viewmodels/mediatorscrenn_viewmodel.dart';
import 'package:upc_app/viewmodels/member_sigin_viewmodel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // ViewModels
  locator.registerFactory(() => MemeberSigInViewModel());
  locator.registerFactory(() => MediatorScreenViewModel());

  // Services
  locator.registerLazySingleton<DataBaseService>(() => FirebaseService());
  locator.registerLazySingleton<NavigationService>(() => NavigationService());

  //Firebase
  locator.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  locator.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());
}
