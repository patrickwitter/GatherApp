import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {dynamic arguements}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguements);
  }

  void navigateBack({dynamic arguements}) {
    return (arguements != null)
        ? navigatorKey.currentState!.pop(arguements)
        : navigatorKey.currentState!.pop();
  }

  Future<dynamic> replaceAndNavigateTo(String routeName, {dynamic arguements}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguements);
  }
}
