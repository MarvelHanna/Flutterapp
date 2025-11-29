import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:drift/web.dart';
import 'package:flutter/foundation.dart';
import '../models/life_area.dart';
import '../models/task_priority.dart';
import '../models/enums.dart';
import '../models/recurrence_rule.dart';
import '../models/reminder.dart';
import '../models/structs.dart';
import 'converters.dart';

part 'database.g.dart';

class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  TextColumn get priority => textEnum<TaskPriority>()();
  TextColumn get status => textEnum<TaskStatus>()();
  DateTimeColumn get dueDate => dateTime().nullable()();
  TextColumn get area => textEnum<LifeArea>()();
  TextColumn get recurrence => text().map(const RecurrenceConverter()).nullable()();
  TextColumn get reminder => text().map(const ReminderConverter()).nullable()();
  TextColumn get subtasks => text().map(const SubTaskListConverter())();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class Habits extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  TextColumn get recurrence => text().map(const RecurrenceConverter()).nullable()();
  TextColumn get area => textEnum<LifeArea>()();
  IntColumn get currentStreak => integer().withDefault(const Constant(0))();
  IntColumn get bestStreak => integer().withDefault(const Constant(0))();
  IntColumn get graceDays => integer().withDefault(const Constant(1))();
  BoolColumn get catchUpAllowed => boolean().withDefault(const Constant(true))();
  TextColumn get reminder => text().map(const ReminderConverter()).nullable()();
}

class Goals extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  TextColumn get area => textEnum<LifeArea>()();
  IntColumn get weeklyTarget => integer().withDefault(const Constant(1))();
  IntColumn get progress => integer().withDefault(const Constant(0))();
  TextColumn get milestones => text().map(const GoalMilestoneListConverter())();
}

class CalendarEvents extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get start => dateTime()();
  DateTimeColumn get end => dateTime()();
  TextColumn get area => textEnum<LifeArea>()();
  TextColumn get location => text().nullable()();
  IntColumn get travelBufferMinutes => integer().withDefault(const Constant(0))();
}

class Notes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get content => text()();
  TextColumn get area => textEnum<LifeArea>()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class Checklists extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get items => text().map(const ChecklistItemListConverter())();
  TextColumn get area => textEnum<LifeArea>()();
}

class MoodEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get mood => integer()();
  IntColumn get energy => integer()();
  TextColumn get note => text().nullable()();
  DateTimeColumn get date => dateTime().withDefault(currentDateAndTime)();
}

class HealthEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get sleepHours => real()();
  IntColumn get waterCups => integer()();
  IntColumn get exerciseMinutes => integer()();
  DateTimeColumn get date => dateTime().withDefault(currentDateAndTime)();
}

@DriftDatabase(tables: [Tasks, Habits, Goals, CalendarEvents, Notes, Checklists, MoodEntries, HealthEntries])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    if (kIsWeb) {
      // Use the built-in web database to avoid external wasm/worker incompatibilities
      // across hosting environments. IndexedDB storage is handled internally.
      return WebDatabase('app_db');
    }

    return driftDatabase(name: 'app_db');
  }
}
