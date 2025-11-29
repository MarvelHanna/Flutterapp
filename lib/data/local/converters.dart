import 'dart:convert';
import 'package:drift/drift.dart';
import '../models/recurrence_rule.dart';
import '../models/reminder.dart';
import '../models/structs.dart';

class RecurrenceConverter extends TypeConverter<RecurrenceRule, String> {
  const RecurrenceConverter();
  @override
  RecurrenceRule fromSql(String fromDb) => RecurrenceRule.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  @override
  String toSql(RecurrenceRule value) => json.encode(value.toJson());
}

class ReminderConverter extends TypeConverter<Reminder, String> {
  const ReminderConverter();
  @override
  Reminder fromSql(String fromDb) => Reminder.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  @override
  String toSql(Reminder value) => json.encode(value.toJson());
}

class SubTaskListConverter extends TypeConverter<List<SubTask>, String> {
  const SubTaskListConverter();
  @override
  List<SubTask> fromSql(String fromDb) => (json.decode(fromDb) as List).map((e) => SubTask.fromJson(e as Map<String, dynamic>)).toList();
  @override
  String toSql(List<SubTask> value) => json.encode(value.map((e) => e.toJson()).toList());
}

class GoalMilestoneListConverter extends TypeConverter<List<GoalMilestone>, String> {
  const GoalMilestoneListConverter();
  @override
  List<GoalMilestone> fromSql(String fromDb) => (json.decode(fromDb) as List).map((e) => GoalMilestone.fromJson(e as Map<String, dynamic>)).toList();
  @override
  String toSql(List<GoalMilestone> value) => json.encode(value.map((e) => e.toJson()).toList());
}

class ChecklistItemListConverter extends TypeConverter<List<ChecklistItem>, String> {
  const ChecklistItemListConverter();
  @override
  List<ChecklistItem> fromSql(String fromDb) => (json.decode(fromDb) as List).map((e) => ChecklistItem.fromJson(e as Map<String, dynamic>)).toList();
  @override
  String toSql(List<ChecklistItem> value) => json.encode(value.map((e) => e.toJson()).toList());
}
