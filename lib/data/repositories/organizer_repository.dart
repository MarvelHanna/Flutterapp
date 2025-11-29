import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../local/isar_service.dart';
import '../models/models.dart';

final organizerRepositoryProvider = Provider<OrganizerRepository>((ref) {
  final isar = ref.watch(isarServiceProvider).isar;
  return OrganizerRepository(isar);
});

class OrganizerSnapshot {
  OrganizerSnapshot({
    required this.tasks,
    required this.events,
    required this.habits,
    required this.goals,
    required this.notes,
    required this.checklists,
    required this.moods,
    required this.healthEntries,
  });

  final List<Task> tasks;
  final List<CalendarEvent> events;
  final List<Habit> habits;
  final List<Goal> goals;
  final List<Note> notes;
  final List<Checklist> checklists;
  final List<MoodEntry> moods;
  final List<HealthEntry> healthEntries;

  int get completedTasks => tasks.where((t) => t.status == TaskStatus.done).length;
  int get openTasks => tasks.where((t) => t.status != TaskStatus.done).length;

  double get hydrationAverage {
    if (healthEntries.isEmpty) return 0;
    return healthEntries.map((e) => e.waterCups).reduce((a, b) => a + b) / healthEntries.length;
  }

  Map<LifeArea, int> get areaLoad {
    final map = <LifeArea, int>{};
    for (final area in LifeArea.values) {
      map[area] = tasks.where((t) => t.area == area && t.status != TaskStatus.done).length +
          goals.where((g) => g.area == area).length +
          habits.where((h) => h.area == area).length;
    }
    return map;
  }
}

class OrganizerRepository {
  OrganizerRepository(this._isar);
  final Isar _isar;

  Future<OrganizerSnapshot> loadSnapshot() async {
    final tasks = await _isar.tasks.where().sortByDueDate().findAll();
    final events = await _isar.calendarEvents.where().sortByStart().findAll();
    final habits = await _isar.habits.where().findAll();
    final goals = await _isar.goals.where().findAll();
    final notes = await _isar.notes.where().findAll();
    final checklists = await _isar.checklists.where().findAll();
    final moods = await _isar.moodEntrys.where().sortByDateDesc().findAll();
    final healthEntries = await _isar.healthEntrys.where().sortByDateDesc().findAll();

    return OrganizerSnapshot(
      tasks: tasks,
      events: events,
      habits: habits,
      goals: goals,
      notes: notes,
      checklists: checklists,
      moods: moods,
      healthEntries: healthEntries,
    );
  }

  Future<List<Task>> tasksForDate(DateTime day) async {
    final start = DateTime(day.year, day.month, day.day);
    final end = start.add(const Duration(days: 1));
    return _isar.tasks.filter().dueDateBetween(start, end).findAll();
  }

  Future<List<CalendarEvent>> eventsForDate(DateTime day) async {
    final start = DateTime(day.year, day.month, day.day);
    final end = start.add(const Duration(days: 1));
    return _isar.calendarEvents.filter().startBetween(start, end).findAll();
  }

  Future<void> saveTask(Task task) async {
    await _isar.writeTxn(() async => _isar.tasks.put(task));
  }

  Future<void> updateTaskStatus(Id id, TaskStatus status) async {
    await _isar.writeTxn(() async {
      final task = await _isar.tasks.get(id);
      if (task != null) {
        task.status = status;
        await _isar.tasks.put(task);
      }
    });
  }

  Future<void> rescheduleTask(Id id, DateTime newDate) async {
    await _isar.writeTxn(() async {
      final task = await _isar.tasks.get(id);
      if (task != null) {
        task.dueDate = newDate;
        task.status = TaskStatus.open;
        await _isar.tasks.put(task);
      }
    });
  }

  Future<void> moveTaskToLater(Id id) async => updateTaskStatus(id, TaskStatus.later);

  Future<void> saveHabit(Habit habit) async {
    await _isar.writeTxn(() async => _isar.habits.put(habit));
  }

  Future<void> saveHabitCompletion(Habit habit, {required bool completed}) async {
    await _isar.writeTxn(() async {
      var existing = await _isar.habits.get(habit.id);
      existing ??= habit;
      if (completed) {
        existing.currentStreak += 1;
        if (existing.currentStreak > existing.bestStreak) {
          existing.bestStreak = existing.currentStreak;
        }
      } else {
        existing.currentStreak = existing.catchUpAllowed ? existing.currentStreak : 0;
      }
      await _isar.habits.put(existing);
    });
  }

  Future<void> saveGoal(Goal goal) async {
    await _isar.writeTxn(() async => _isar.goals.put(goal));
  }

  Future<void> saveEvent(CalendarEvent event) async {
    await _isar.writeTxn(() async => _isar.calendarEvents.put(event));
  }

  Future<void> saveNote(Note note) async {
    await _isar.writeTxn(() async => _isar.notes.put(note));
  }

  Future<void> saveChecklist(Checklist checklist) async {
    await _isar.writeTxn(() async => _isar.checklists.put(checklist));
  }

  Future<void> saveMood(MoodEntry entry) async {
    await _isar.writeTxn(() async => _isar.moodEntrys.put(entry));
  }

  Future<void> saveHealthEntry(HealthEntry entry) async {
    await _isar.writeTxn(() async => _isar.healthEntrys.put(entry));
  }

  Future<List<String>> globalSearch(String query) async {
    if (query.isEmpty) return [];
    final lower = query.toLowerCase();
    final results = <String>[];

    final tasks = await _isar.tasks.filter().titleContains(lower, caseSensitive: false).findAll();
    final notes = await _isar.notes.filter().titleContains(lower, caseSensitive: false).or().contentContains(lower, caseSensitive: false).findAll();
    final events = await _isar.calendarEvents.filter().titleContains(lower, caseSensitive: false).findAll();
    final goals = await _isar.goals.filter().titleContains(lower, caseSensitive: false).findAll();

    results
      ..addAll(tasks.map((t) => 'Task: ${t.title}'))
      ..addAll(events.map((e) => 'Event: ${e.title}'))
      ..addAll(goals.map((g) => 'Goal: ${g.title}'))
      ..addAll(notes.map((n) => 'Note: ${n.title}'));

    return results;
  }
}
