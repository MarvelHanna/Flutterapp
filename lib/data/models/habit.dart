import 'package:isar/isar.dart';

import 'life_area.dart';
import 'recurrence_rule.dart';
import 'reminder.dart';

part 'habit.g.dart';

@collection
class Habit {
  Habit({
    this.id = Isar.autoIncrement,
    required this.title,
    this.description,
    this.recurrence,
    this.area = LifeArea.health,
    this.currentStreak = 0,
    this.bestStreak = 0,
    this.graceDays = 1,
    this.catchUpAllowed = true,
    this.reminder,
  });

  Id id;
  String title;
  String? description;
  RecurrenceRule? recurrence;
  @Enumerated(EnumType.name)
  LifeArea area;
  int currentStreak;
  int bestStreak;
  int graceDays;
  bool catchUpAllowed;
  Reminder? reminder;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'recurrence': recurrence?.toJson(),
        'area': area.name,
        'currentStreak': currentStreak,
        'bestStreak': bestStreak,
        'graceDays': graceDays,
        'catchUpAllowed': catchUpAllowed,
        'reminder': reminder?.toJson(),
      };

  factory Habit.fromJson(Map<String, dynamic> json) => Habit(
        id: json['id'] as int? ?? Isar.autoIncrement,
        title: json['title'] as String? ?? '',
        description: json['description'] as String?,
        recurrence: json['recurrence'] != null ? RecurrenceRule.fromJson(Map<String, dynamic>.from(json['recurrence'] as Map)) : null,
        area: LifeArea.values.firstWhere((a) => a.name == json['area'], orElse: () => LifeArea.health),
        currentStreak: json['currentStreak'] as int? ?? 0,
        bestStreak: json['bestStreak'] as int? ?? 0,
        graceDays: json['graceDays'] as int? ?? 1,
        catchUpAllowed: json['catchUpAllowed'] as bool? ?? true,
        reminder: json['reminder'] != null ? Reminder.fromJson(Map<String, dynamic>.from(json['reminder'] as Map)) : null,
      );
}
