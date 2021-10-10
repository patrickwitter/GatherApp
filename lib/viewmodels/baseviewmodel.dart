import 'package:flutter/cupertino.dart';
import 'package:upc_app/enums/enums.dart';

class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  bool get isBusy => _state == ViewState.busy;

  void setState(ViewState newState) {
    _state = newState;
    notifyListeners();
  }
}
