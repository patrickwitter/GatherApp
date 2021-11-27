import 'package:upc_app/constants/notification_jsonKeys.dart';

class Notifications {
  late String _notificationTxt;
  late DateTime _creationDate;
  late String _id;

  Notifications({required String text, DateTime? date, String? id}) {
    this._notificationTxt = text;
    this._creationDate = date ?? DateTime.now();
    this._id = id ?? this._id;
  }

  String get notificationTxt => this._notificationTxt;
  DateTime get notificationDate => this._creationDate;
  String get id => this._id;

  String get notificDateFormat {
    return "${this._creationDate.day} / ${this._creationDate.month} / ${this._creationDate.year}";
  }

  factory Notifications.fromJson(Map<String, dynamic> json) {
    return Notifications(
        text: json[NotificationKey.text],
        date: DateTime.parse(json[NotificationKey.creationDt]),
        id: json[NotificationKey.id]);
  }

  Map<String, dynamic> toJson() {
    return {
      NotificationKey.text: this._notificationTxt,
      NotificationKey.creationDt: this._creationDate,
      NotificationKey.id: this._id,
    };
  }
}
