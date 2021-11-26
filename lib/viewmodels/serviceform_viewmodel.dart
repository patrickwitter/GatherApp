import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upc_app/locator.dart';
import 'package:upc_app/models/service.dart';
import 'package:upc_app/services/firebase_service.dart';
import 'package:upc_app/services/navigation_service.dart';
import 'package:upc_app/viewmodels/baseviewmodel.dart';

class ServiceFormViewModel extends BaseViewModel {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController availSpaceCtrl = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  late DateTime initialDate;
  late TimeOfDay initialTime;
  String dateText = "Select Date";
  String timeText = "Select Time";
  String title = "Create Service";

  FirebaseService _service = locator<FirebaseService>();
  NavigationService _navServ = locator<NavigationService>();
  Service? currService;

  void submitServiceForm() {
    Service service;
    if (currService == null) {
      service = Service(
        serviceDt: _selectedDate!,
        serviceTm: _selectedTime!,
        availSpace: int.parse(availSpaceCtrl.text),
      );
    } else {
      service = Service(
          serviceDt: _selectedDate!,
          serviceTm: _selectedTime!,
          availSpace: int.parse(availSpaceCtrl.text),
          id: currService!.id);
    }
    _service.addService(service);
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
      dateText = _formatDate(_selectedDate!);
      notifyListeners();
    } else {
      return;
    }
  }

  String _formatDate(DateTime date) {
    return "${date.month}/${date.day}/${date.year}";
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

  void initialize(Service? currServ, {BuildContext? context}) {
    if (currServ != null) {
      currService = currServ;
      title = "Update Service";

      dateText = currServ.serviceDateFormat;

      if (context != null) {
        timeText = currServ.serviceTime.format(context);
      }

      initialDate = currServ.serviceDate;
      initialTime = currServ.serviceTime;

      _selectedDate = currServ.serviceDate;
      _selectedTime = currServ.serviceTime;

      availSpaceCtrl.text = currServ.availSp.toString();
      notifyListeners();
    }
  }
}
