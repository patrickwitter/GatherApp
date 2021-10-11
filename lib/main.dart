import 'package:flutter/material.dart';
import 'package:upc_app/locator.dart';
import 'package:upc_app/router.dart' as router;
import 'package:upc_app/constants/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      initialRoute: Routes.mediatorScreen,
    );
  }
}
