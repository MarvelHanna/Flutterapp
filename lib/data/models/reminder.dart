import 'package:isar/isar.dart';

part 'reminder.g.dart';

@embedded
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

  Map<String, dynamic> toJson() => {
        'scheduledFor': scheduledFor?.toIso8601String(),
        'isLocationBased': isLocationBased,
        'latitude': latitude,
        'longitude': longitude,
        'locationLabel': locationLabel,
        'note': note,
      };

  factory Reminder.fromJson(Map<String, dynamic> json) => Reminder(
        scheduledFor: json['scheduledFor'] != null ? DateTime.tryParse(json['scheduledFor'] as String) : null,
        isLocationBased: json['isLocationBased'] as bool? ?? false,
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
        locationLabel: json['locationLabel'] as String?,
        note: json['note'] as String?,
      );
}
