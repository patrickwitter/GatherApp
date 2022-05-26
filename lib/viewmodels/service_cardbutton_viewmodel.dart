import 'package:upc_app/constants/routes.dart';
import 'package:upc_app/locator.dart';
import 'package:upc_app/models/service.dart';
import 'package:upc_app/services/navigation_service.dart';
import 'package:upc_app/viewmodels/baseviewmodel.dart';

class ServiceCardButtonViewModel extends BaseViewModel {
  // ignore: unused_field
  late Service _serv;
  NavigationService _navserv = locator<NavigationService>();

  void initialize({required Service serv}) {
    // print("initialize ran for ${serv.availSp}");
    _serv = serv;
    notifyListeners();
  }

  void showupdateForm(Service serv) {
    // print("cardbutton view ${_serv.availSp}");
    _navserv.navigateTo(Routes.ServiceForm, arguements: {'service': serv});
  }
}
