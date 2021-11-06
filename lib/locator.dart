import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:upc_app/services/database_service.dart';
import 'package:upc_app/services/firebase_service.dart';
import 'package:upc_app/services/navigation_service.dart';
import 'package:upc_app/viewmodels/admin_view_viewmodel.dart';
import 'package:upc_app/viewmodels/mediatorscrenn_viewmodel.dart';
import 'package:upc_app/viewmodels/member_sigin_viewmodel.dart';
import 'package:upc_app/viewmodels/member_signup_viewmodel.dart';
import 'package:upc_app/viewmodels/member_update_viewmodel.dart';
import 'package:upc_app/viewmodels/member_view_viewmodel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // ViewModels
  locator.registerFactory(() => MemeberSigInViewModel());
  locator.registerFactory(() => MediatorScreenViewModel());
  locator.registerFactory(() => MemberSignUpViewModel());
  locator.registerFactory(() => MemberUpdateViewModel());
  locator.registerFactory(() => MemberView_ViewModel());
  locator.registerFactory(() => AdminView_ViewModel());

  // Services
  locator.registerLazySingleton<FirebaseService>(() => FirebaseService());
  locator.registerLazySingleton<NavigationService>(() => NavigationService());

  //Firebase
  locator.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  locator.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());
  locator.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);
}
