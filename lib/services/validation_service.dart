import 'package:flutter/material.dart';

class ValidationService {
  String? validateFirstLastName(String value) {
    if (value.isEmpty) {
      return 'Must not be left blank.';
    }
    const String pattern = r"^[A-Za-z]$";
    final RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return "Invalid Firstname or Last-Name";
    }
    return null;
  }

  String? validateNum(String value) {
    if (value.isEmpty) {
      return 'Must not be left blank.';
    }
    const String pattern = r"^(0|[1-9][0-9]*)$";
    final RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return "Invalid Entry. Enter digits 0 -9";
    }
    return null;
  }

  String? validateAplhaNum(String value) {
    if (value.isEmpty) {
      return 'Must not be left blank.';
    }
    const String pattern = r"[A-Za-z0-9_]";
    final RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return "Invalid Entry. Enter number or Letter";
    }
    return null;
  }

  String? validateDate(DateTime? date, DateTime presentDate) {
    if (date == null) {
      return "Date cannot be left blank";
    } else if (presentDate.difference(date).inDays > 0) {
      return "Cannot pick Date that has passed";
    }
    return null;
  }

  String? validateTime(
    TimeOfDay? time,
  ) {
    if (time == null) {
      return "Time cannot be left blank";
    } else if (time.hour > 24 || time.minute > 59) {
      return "Invalid input for time";
    }
    return null;
  }

  String? validDateAndTime({
    required DateTime presentDate,
    required TimeOfDay presentTime,
    required DateTime chosenDate,
    required TimeOfDay chosenTime,
  }) {
    bool equalhr = presentTime.hour == chosenTime.hour;
    bool isvalidHr = presentTime.hour < chosenTime.hour;
    bool isvalidMin = chosenTime.minute > presentTime.minute;

    bool isvalidTime = isvalidHr || (equalhr && isvalidMin);

    int daydiff = presentDate.difference(chosenDate).inDays;

    if (daydiff == 0 && !isvalidTime) {
      return "Cannot choose Time that has passed on a current day";
    }
    return null;
  }
}
