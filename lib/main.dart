import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:upc_app/locator.dart';
import 'package:upc_app/router.dart' as router;
import 'package:upc_app/constants/routes.dart' as routeConst;
import 'package:upc_app/services/navigation_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(UPCApp());
}

class UPCApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: router.generateRoute,
      initialRoute: routeConst.Routes.mediatorScreen,
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
