import 'package:json_annotation/json_annotation.dart';

part 'recurrence_rule.g.dart';

enum RecurrenceFrequency { none, daily, weekly, monthly, custom }

@JsonSerializable()
class RecurrenceRule {
  RecurrenceRule({
    this.frequency = RecurrenceFrequency.none,
    this.interval = 1,
    this.weekdays = const [],
    this.endsOn,
  });

  RecurrenceFrequency frequency;
  int interval;
  List<int> weekdays; // 1=Mon ... 7=Sun
  DateTime? endsOn;

  factory RecurrenceRule.fromJson(Map<String, dynamic> json) => _$RecurrenceRuleFromJson(json);
  Map<String, dynamic> toJson() => _$RecurrenceRuleToJson(this);

  String get label {
    switch (frequency) {
      case RecurrenceFrequency.none:
        return 'One-time';
      case RecurrenceFrequency.daily:
        return 'Daily';
      case RecurrenceFrequency.weekly:
        return 'Weekly';
      case RecurrenceFrequency.monthly:
        return 'Monthly';
      case RecurrenceFrequency.custom:
        return 'Custom x$interval';
    }
  }
}
