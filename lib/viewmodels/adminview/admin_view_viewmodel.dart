import 'package:flutter/material.dart';
import 'package:upc_app/constants/routes.dart';
import 'package:upc_app/locator.dart';
import 'package:upc_app/services/firebase_service.dart';
import 'package:upc_app/services/navigation_service.dart';
import 'package:upc_app/viewmodels/baseviewmodel.dart';
import 'package:upc_app/viewmodels/theme_viewmodel.dart';

// ignore: camel_case_types
class AdminView_ViewModel extends BaseViewModel {
  int currIndex = 0;
  FirebaseService _service = locator<FirebaseService>();
  NavigationService _navserv = locator<NavigationService>();
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  final AppThemeViewModel _appThemeViewModel = locator<AppThemeViewModel>();

  void updateTabIndex(int newindex) {
    currIndex = newindex;
    notifyListeners();
  }

  bool isHome() {
    return currIndex == 0;
  }

  void signout() {
    _service.logoutUser();
  }

  void showServiceForm() {
    _navserv.navigateTo(Routes.ServiceForm);
  }

  void showNotifcation() {
    _navserv.navigateTo(Routes.NoficationAdminPage);
  }

  void switchDarkMode(darkMode) {
    _appThemeViewModel.toogleTheme(darkMode: darkMode);
    notifyListeners();
  }

  bool getDarkMode() {
    return _appThemeViewModel.isDarkMode;
  }
}
