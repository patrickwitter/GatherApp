import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:upc_app/locator.dart';
import 'package:upc_app/router.dart' as router;
import 'package:upc_app/constants/routes.dart' as routeConst;
import 'package:upc_app/services/navigation_service.dart';
import 'package:upc_app/theme/theme.dart';
import 'package:upc_app/viewmodels/theme_viewmodel.dart';
import 'package:upc_app/views/base_view.dart';
import 'package:upc_app/views/error_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return CustomErrorWidget(details: details);
  };
  await Firebase.initializeApp();

  await setupLocator();

  runApp(UPCApp());
}

class UPCApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Sizer(
      builder: (BuildContext context, Orientation orientation,
              DeviceType deviceType) =>
          BaseView<AppThemeViewModel>(builder: ((context, model, child) {
        return MaterialApp(
          title: 'UPC Gather App',
          themeMode: model.themeMode,
          theme: appLightTheme,
          darkTheme: appDarkTheme,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: router.generateRoute,
          initialRoute: routeConst.Routes.mediatorScreen,
          navigatorKey: locator<NavigationService>().navigatorKey,
        );
      })),
    );
  }
}
