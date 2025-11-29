// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reminder _$ReminderFromJson(Map<String, dynamic> json) => Reminder(
      scheduledFor: json['scheduledFor'] == null
          ? null
          : DateTime.parse(json['scheduledFor'] as String),
      isLocationBased: json['isLocationBased'] as bool? ?? false,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      locationLabel: json['locationLabel'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$ReminderToJson(Reminder instance) => <String, dynamic>{
      'scheduledFor': instance.scheduledFor?.toIso8601String(),
      'isLocationBased': instance.isLocationBased,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'locationLabel': instance.locationLabel,
      'note': instance.note,
    };
