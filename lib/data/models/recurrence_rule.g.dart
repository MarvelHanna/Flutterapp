// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recurrence_rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecurrenceRule _$RecurrenceRuleFromJson(Map<String, dynamic> json) =>
    RecurrenceRule(
      frequency: $enumDecodeNullable(
              _$RecurrenceFrequencyEnumMap, json['frequency']) ??
          RecurrenceFrequency.none,
      interval: (json['interval'] as num?)?.toInt() ?? 1,
      weekdays: (json['weekdays'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      endsOn: json['endsOn'] == null
          ? null
          : DateTime.parse(json['endsOn'] as String),
    );

Map<String, dynamic> _$RecurrenceRuleToJson(RecurrenceRule instance) =>
    <String, dynamic>{
      'frequency': _$RecurrenceFrequencyEnumMap[instance.frequency]!,
      'interval': instance.interval,
      'weekdays': instance.weekdays,
      'endsOn': instance.endsOn?.toIso8601String(),
    };

const _$RecurrenceFrequencyEnumMap = {
  RecurrenceFrequency.none: 'none',
  RecurrenceFrequency.daily: 'daily',
  RecurrenceFrequency.weekly: 'weekly',
  RecurrenceFrequency.monthly: 'monthly',
  RecurrenceFrequency.custom: 'custom',
};
