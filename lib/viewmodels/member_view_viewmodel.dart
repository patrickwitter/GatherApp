import 'package:flutter/material.dart';
import 'package:upc_app/viewmodels/baseviewmodel.dart';

class MemberView_ViewModel extends BaseViewModel {
  int currIndex = 0;

  void updateIndex(int newindex) {
    currIndex = newindex;
    notifyListeners();
  }

  bool isHome() {
    return currIndex == 0;
  }
}
