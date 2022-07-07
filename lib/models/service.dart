import 'package:flutter/material.dart';
import 'package:upc_app/constants/service_jsonKey.dart';
import 'package:upc_app/locator.dart';
import 'package:upc_app/services/firebase_service.dart';

class Service {
  late DateTime _serviceDate;
  late int _numAttendes;
  late String _id;
  late int _availSpace;
  late TimeOfDay _serviceTime;
  static FirebaseService _service = locator<FirebaseService>();
  Service({
    required DateTime serviceDt,
    required int availSpace,
    required TimeOfDay serviceTm,
    int? numAtt,
    String? id,
  }) {
    this._serviceDate = serviceDt;
    this._availSpace = availSpace;
    this._numAttendes = numAtt ?? 0;
    this._id = id ?? _generateId();
    this._serviceTime = serviceTm;
  }

  String get id => _id;
  int get availSp => _availSpace;
  TimeOfDay get serviceTime => _serviceTime;
  int get numAttend => _numAttendes;

  DateTime get serviceDate => _serviceDate;

  String get serviceDateFormat {
    return "${this._serviceDate.day} / ${this._serviceDate.month} / ${this._serviceDate.year}";
  }

  bool isFull() {
    return this._availSpace == 0;
  }

  void register() {
    _numAttendes++;
    _availSpace--;
  }

  void unregister() {
    _numAttendes--;
    _availSpace++;
  }

  String _generateId() {
    return DateTime.now().toIso8601String();
  }

  factory Service.fromJson(Map<String, dynamic> json) {
    Service x = Service(
      serviceDt: DateTime.parse(json[ServiceKey.date]),
      serviceTm: stringtoTime(json[ServiceKey.time]),
      availSpace: int.parse(json[ServiceKey.availSpace]),
      id: json[ServiceKey.id],
      numAtt: json[ServiceKey.attendees],
    );

    return x;
  }

  Map<String, dynamic> tojson() {
    return {
      ServiceKey.date: _serviceDate.toIso8601String(),
      ServiceKey.time: timeToString(this._serviceTime),
      ServiceKey.availSpace: this._availSpace.toString(),
      ServiceKey.attendees: this._numAttendes,
      ServiceKey.id: this._id,
    };
  }

  static String timeToString(TimeOfDay time) {
    return "${time.hour}:${time.minute}";
  }

  static TimeOfDay stringtoTime(String? time) {
    if (time != null) {
      List<String> val = time.split(":");
      return new TimeOfDay(hour: int.parse(val[0]), minute: int.parse(val[1]));
    } else {
      return TimeOfDay.now();
    }
  }
}
