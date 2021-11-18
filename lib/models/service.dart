import 'package:upc_app/constants/service_jsonKey.dart';

class Service {
  late DateTime _serviceDate;
  late bool _isOpen;
  late int _numAttendes;
  late String _id;
  late int _availSpace;

  Service({
    required DateTime serviceDt,
    required bool isOpen,
    required int availSpace,
    int? numAtt,
    String? id,
  }) {
    this._serviceDate = serviceDt;
    this._isOpen = isOpen;
    this._availSpace = availSpace;
    this._numAttendes = numAtt ?? 0;
    this._id = id ?? _generateId();
  }

  String get id => _id;
  int get availSp => _availSpace;
  bool get isopen => _isOpen;
  int get numAttend => _numAttendes;

  String get serviceDate {
    return "${this._serviceDate.day} / ${this._serviceDate.month} / ${this._serviceDate.year}";
  }

  bool isFull() {
    return this._availSpace == 0;
  }

  void register() {
    _numAttendes++;
    _availSpace--;
  }

  String _generateId() {
    return DateTime.now().toIso8601String();
  }

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        serviceDt: DateTime.parse(json[ServiceKey.date]),
        isOpen: (json[ServiceKey.isOpen] == 'true'),
        availSpace: int.parse(json[ServiceKey.availSpace]),
        id: json[ServiceKey.id],
        numAtt: json[ServiceKey.attendees],
      );

  Map<String, dynamic> tojson() {
    return {
      ServiceKey.date: _serviceDate.toIso8601String(),
      ServiceKey.isOpen: openString(),
      ServiceKey.availSpace: this._availSpace.toString(),
      ServiceKey.attendees: this._numAttendes,
      ServiceKey.id: this._id,
    };
  }

  String openString() => (this._isOpen) ? 'true' : 'false';
}
