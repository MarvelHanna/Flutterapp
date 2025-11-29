import 'package:json_annotation/json_annotation.dart';

part 'reminder.g.dart';

@JsonSerializable()
class Reminder {
  Reminder({
    this.scheduledFor,
    this.isLocationBased = false,
    this.latitude,
    this.longitude,
    this.locationLabel,
    this.note,
  });

  DateTime? scheduledFor;
  bool isLocationBased;
  double? latitude;
  double? longitude;
  String? locationLabel;
  String? note;

  factory Reminder.fromJson(Map<String, dynamic> json) => _$ReminderFromJson(json);
  Map<String, dynamic> toJson() => _$ReminderToJson(this);
}
