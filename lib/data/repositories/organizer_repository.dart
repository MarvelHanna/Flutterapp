import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../local/database.dart';
import '../models/models.dart';
import '../../main.dart'; // for databaseProvider

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

final organizerRepositoryProvider = Provider<OrganizerRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return OrganizerRepository(db);
});

class OrganizerRepository {
  OrganizerRepository(this._db);
  final AppDatabase _db;

  Future<OrganizerSnapshot> loadSnapshot() async {
    final tasks = await (_db.select(_db.tasks)..orderBy([(t) => OrderingTerm(expression: t.dueDate)])).get();
    final events = await (_db.select(_db.calendarEvents)..orderBy([(e) => OrderingTerm(expression: e.start)])).get();
    final habits = await _db.select(_db.habits).get();
    final goals = await _db.select(_db.goals).get();
    final notes = await _db.select(_db.notes).get();
    final checklists = await _db.select(_db.checklists).get();
    final moods = await (_db.select(_db.moodEntries)..orderBy([(m) => OrderingTerm(expression: m.date, mode: OrderingMode.desc)])).get();
    final health = await (_db.select(_db.healthEntries)..orderBy([(h) => OrderingTerm(expression: h.date, mode: OrderingMode.desc)])).get();

    return OrganizerSnapshot(
      tasks: tasks,
      events: events,
      habits: habits,
      goals: goals,
      notes: notes,
      checklists: checklists,
      moods: moods,
      healthEntries: health,
    );
  }

  Future<List<Task>> tasksForDate(DateTime day) async {
    final start = DateTime(day.year, day.month, day.day);
    final end = start.add(const Duration(days: 1));
    return (_db.select(_db.tasks)..where((t) => t.dueDate.isBetweenValues(start, end))).get();
  }

  Future<List<CalendarEvent>> eventsForDate(DateTime day) async {
    final start = DateTime(day.year, day.month, day.day);
    final end = start.add(const Duration(days: 1));
    return (_db.select(_db.calendarEvents)..where((e) => e.start.isBetweenValues(start, end))).get();
  }

  Future<void> saveTask(Task task) async {
    if (task.id == 0) {
      await _db.into(_db.tasks).insert(TasksCompanion.insert(
        title: task.title,
        description: Value(task.description),
        priority: task.priority,
        status: task.status,
        dueDate: Value(task.dueDate),
        area: task.area,
        recurrence: Value(task.recurrence),
        reminder: Value(task.reminder),
        subtasks: task.subtasks,
      ));
    } else {
      await _db.update(_db.tasks).replace(task);
    }
  }

  Future<void> updateTaskStatus(int id, TaskStatus status) async {
    await (_db.update(_db.tasks)..where((t) => t.id.equals(id))).write(TasksCompanion(status: Value(status)));
  }

  Future<void> rescheduleTask(int id, DateTime newDate) async {
    await (_db.update(_db.tasks)..where((t) => t.id.equals(id))).write(TasksCompanion(
      dueDate: Value(newDate),
      status: const Value(TaskStatus.open),
    ));
  }

  Future<void> moveTaskToLater(int id) async => updateTaskStatus(id, TaskStatus.later);

  Future<void> saveHabit(Habit habit) async {
    if (habit.id == 0) {
      await _db.into(_db.habits).insert(HabitsCompanion.insert(
        title: habit.title,
        description: Value(habit.description),
        recurrence: Value(habit.recurrence),
        area: habit.area,
        currentStreak: Value(habit.currentStreak),
        bestStreak: Value(habit.bestStreak),
        graceDays: Value(habit.graceDays),
        catchUpAllowed: Value(habit.catchUpAllowed),
        reminder: Value(habit.reminder),
      ));
    } else {
      await _db.update(_db.habits).replace(habit);
    }
  }

  Future<void> saveHabitCompletion(Habit habit, {required bool completed}) async {
    var currentStreak = habit.currentStreak;
    var bestStreak = habit.bestStreak;

    if (completed) {
      currentStreak += 1;
      if (currentStreak > bestStreak) {
        bestStreak = currentStreak;
      }
    } else {
      currentStreak = habit.catchUpAllowed ? currentStreak : 0;
    }

    await _db.update(_db.habits).replace(habit.copyWith(
      currentStreak: currentStreak,
      bestStreak: bestStreak,
    ));
  }

  Future<void> saveGoal(Goal goal) async {
    if (goal.id == 0) {
      await _db.into(_db.goals).insert(GoalsCompanion.insert(
        title: goal.title,
        description: Value(goal.description),
        area: goal.area,
        weeklyTarget: Value(goal.weeklyTarget),
        progress: Value(goal.progress),
        milestones: goal.milestones,
      ));
    } else {
      await _db.update(_db.goals).replace(goal);
    }
  }

  Future<void> saveEvent(CalendarEvent event) async {
    if (event.id == 0) {
      await _db.into(_db.calendarEvents).insert(CalendarEventsCompanion.insert(
        title: event.title,
        description: Value(event.description),
        start: event.start,
        end: event.end,
        area: event.area,
        location: Value(event.location),
        travelBufferMinutes: Value(event.travelBufferMinutes),
      ));
    } else {
      await _db.update(_db.calendarEvents).replace(event);
    }
  }

  Future<void> saveNote(Note note) async {
    if (note.id == 0) {
      await _db.into(_db.notes).insert(NotesCompanion.insert(
        title: note.title,
        content: note.content,
        area: note.area,
        createdAt: Value(note.createdAt),
      ));
    } else {
      await _db.update(_db.notes).replace(note);
    }
  }

  Future<void> saveChecklist(Checklist checklist) async {
    if (checklist.id == 0) {
      await _db.into(_db.checklists).insert(ChecklistsCompanion.insert(
        title: checklist.title,
        items: checklist.items,
        area: checklist.area,
      ));
    } else {
      await _db.update(_db.checklists).replace(checklist);
    }
  }

  Future<void> saveMood(MoodEntry entry) async {
    if (entry.id == 0) {
      await _db.into(_db.moodEntries).insert(MoodEntriesCompanion.insert(
        mood: entry.mood,
        energy: entry.energy,
        note: Value(entry.note),
        date: Value(entry.date),
      ));
    } else {
      await _db.update(_db.moodEntries).replace(entry);
    }
  }

  Future<void> saveHealthEntry(HealthEntry entry) async {
    if (entry.id == 0) {
      await _db.into(_db.healthEntries).insert(HealthEntriesCompanion.insert(
        sleepHours: entry.sleepHours,
        waterCups: entry.waterCups,
        exerciseMinutes: entry.exerciseMinutes,
        date: Value(entry.date),
      ));
    } else {
      await _db.update(_db.healthEntries).replace(entry);
    }
  }

  Future<List<String>> globalSearch(String query) async {
    if (query.isEmpty) return [];
    final lower = query.toLowerCase();
    
    final tasks = await (_db.select(_db.tasks)..where((t) => t.title.like('%$query%'))).get();
    final events = await (_db.select(_db.calendarEvents)..where((e) => e.title.like('%$query%'))).get();
    final goals = await (_db.select(_db.goals)..where((g) => g.title.like('%$query%'))).get();
    final notes = await (_db.select(_db.notes)..where((n) => n.title.like('%$query%') | n.content.like('%$query%'))).get();

    return [
      ...tasks.map((t) => 'Task: ${t.title}'),
      ...events.map((e) => 'Event: ${e.title}'),
      ...goals.map((g) => 'Goal: ${g.title}'),
      ...notes.map((n) => 'Note: ${n.title}'),
    ];
  }
}
