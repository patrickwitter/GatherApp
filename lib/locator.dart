import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:upc_app/services/firebase_service.dart';
import 'package:upc_app/services/navigation_service.dart';
import 'package:upc_app/services/shared_preferences_service.dart';
import 'package:upc_app/services/validation_service.dart';
import 'package:upc_app/viewmodels/adminview/admin_view_viewmodel.dart';
import 'package:upc_app/viewmodels/adminview/admin_viewinfectedmembers_viewmodel.dart';
import 'package:upc_app/viewmodels/adminview/admin_viewinfectedservices_viewmodel.dart';
import 'package:upc_app/viewmodels/adminview/adminhome_viewmodel.dart';
import 'package:upc_app/viewmodels/adminview/adminviewmember_viewmodel.dart';
import 'package:upc_app/viewmodels/mediatorscrenn_viewmodel.dart';
import 'package:upc_app/viewmodels/member_sigin_viewmodel.dart';
import 'package:upc_app/viewmodels/member_signup_viewmodel.dart';
import 'package:upc_app/viewmodels/memberview/member_update_viewmodel.dart';
import 'package:upc_app/viewmodels/memberview/member_home_viewmodel.dart';
import 'package:upc_app/viewmodels/memberview/member_view_viewmodel.dart';
import 'package:upc_app/viewmodels/memberview/memberalert_viewmodel.dart';
import 'package:upc_app/viewmodels/notificationAdminView_viewmodel.dart';
import 'package:upc_app/viewmodels/notificationView_viewmodel.dart';
import 'package:upc_app/viewmodels/service_cardbutton_viewmodel.dart';
import 'package:upc_app/viewmodels/serviceform_viewmodel.dart';
import 'package:upc_app/viewmodels/theme_viewmodel.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // ViewModels
  locator.registerFactory(() => MemeberSigInViewModel());
  locator.registerFactory(() => MediatorScreenViewModel());
  locator.registerFactory(() => MemberSignUpViewModel());
  locator.registerFactory(() => MemberUpdateViewModel());
  locator.registerFactory(() => MemberView_ViewModel());
  locator.registerFactory(() => AdminView_ViewModel());
  locator.registerFactory(() => ServiceFormViewModel());
  locator.registerFactory(() => ServiceCardButtonViewModel());
  locator.registerFactory(() => NotificationViewViewModel());
  locator.registerFactory(() => NotificationAdminView_ViewModel());
  locator.registerFactory(() => MemberHomeViewModel());
  locator.registerFactory(() => MemeberAlertViewModel());
  locator.registerFactory(() => AdminHomeViewModel());
  locator.registerFactory(() => AdminViewMemberViewModel());
  locator.registerFactory(() => AdminViewInfectedMembersViewModel());
  locator.registerFactory(() => AdminViewInfectedServicesViewModel());

  // Services
  locator.registerLazySingleton<FirebaseService>(() => FirebaseService());
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<ValidationService>(() => ValidationService());
  locator.registerLazySingleton<SharedPreferencesService>(
      () => SharedPreferencesService());

  await SharedPreferencesService.init();
  //Firebase
  locator.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  locator.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());
  locator.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);

  // ViewModels that depend on servies that are installed
  locator.registerLazySingleton<AppThemeViewModel>(() => AppThemeViewModel());
}
