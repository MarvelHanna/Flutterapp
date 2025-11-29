import 'package:isar/isar.dart';

part 'recurrence_rule.g.dart';

enum RecurrenceFrequency { none, daily, weekly, monthly, custom }

@embedded
class RecurrenceRule {
  RecurrenceRule({
    this.frequency = RecurrenceFrequency.none,
    this.interval = 1,
    this.weekdays = const [],
    this.endsOn,
  });

  @Enumerated(EnumType.name)
  RecurrenceFrequency frequency;
  int interval;
  List<int> weekdays; // 1=Mon ... 7=Sun
  DateTime? endsOn;

  Map<String, dynamic> toJson() => {
        'frequency': frequency.name,
        'interval': interval,
        'weekdays': weekdays,
        'endsOn': endsOn?.toIso8601String(),
      };

  factory RecurrenceRule.fromJson(Map<String, dynamic> json) => RecurrenceRule(
        frequency: RecurrenceFrequency.values
            .firstWhere((f) => f.name == json['frequency'], orElse: () => RecurrenceFrequency.none),
        interval: json['interval'] as int? ?? 1,
        weekdays: (json['weekdays'] as List<dynamic>?)?.cast<int>() ?? const [],
        endsOn: json['endsOn'] != null ? DateTime.tryParse(json['endsOn'] as String) : null,
      );

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
