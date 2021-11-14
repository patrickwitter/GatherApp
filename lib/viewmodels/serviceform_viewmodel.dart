import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upc_app/locator.dart';
import 'package:upc_app/models/service.dart';
import 'package:upc_app/services/firebase_service.dart';
import 'package:upc_app/services/navigation_service.dart';
import 'package:upc_app/viewmodels/baseviewmodel.dart';

class ServiceFormViewModel extends BaseViewModel {
  TextEditingController numAttendCtrl = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  late DateTime initialDate;
  late TimeOfDay initialTime;
  String dateText = "Select Date";
  String timeText = "Select Time";
  FirebaseService _service = locator<FirebaseService>();
  NavigationService _navServ = locator<NavigationService>();

  void submitServiceForm() {
    _service.addService(Service(
      serviceDt: _selectedDate!,
      isOpen: true,
      availSpace: int.parse(numAttendCtrl.text),
    ));
    _navServ.navigateBack();
  }

  Future pickDate(BuildContext context) async {
    initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? initialDate,
      firstDate: initialDate,
      lastDate: DateTime(initialDate.year + 5),
    );

    if (newDate != null) {
      _selectedDate = newDate;
      dateText =
          "${_selectedDate!.month}/${_selectedDate!.day}/${_selectedDate!.year}";
      notifyListeners();
    } else {
      return;
    }
  }

  Future pickTime(BuildContext context) async {
    initialTime = TimeOfDay.now();

    final newTime = await showTimePicker(
        context: context, initialTime: _selectedTime ?? initialTime);

    if (newTime != null) {
      _selectedTime = newTime;
      timeText = _selectedTime!.format(context);
      notifyListeners();
    }
  }
}
