import 'package:drift/drift.dart';
import '../models/models.dart';
import 'database.dart';

class SeedData {
  static List<TasksCompanion> tasks(DateTime now) {
    return [
      TasksCompanion.insert(
        title: 'Review quarterly goals',
        description: const Value('Check progress on personal and work goals'),
        priority: TaskPriority.high,
        status: TaskStatus.open,
        dueDate: Value(now),
        area: LifeArea.work,
        subtasks: const [],
      ),
      TasksCompanion.insert(
        title: 'Grocery shopping',
        description: const Value('Milk, eggs, bread, veggies'),
        priority: TaskPriority.medium,
        status: TaskStatus.open,
        dueDate: Value(now.add(const Duration(hours: 2))),
        area: LifeArea.home,
        subtasks: const [],
      ),
    ];
  }

  static List<CalendarEventsCompanion> events(DateTime now) {
    return [
      CalendarEventsCompanion.insert(
        title: 'Team Sync',
        description: const Value('Weekly sync with the team'),
        start: now.add(const Duration(hours: 1)),
        end: now.add(const Duration(hours: 2)),
        area: LifeArea.work,
        location: const Value('Zoom'),
      ),
    ];
  }

  static List<HabitsCompanion> habits() {
    return [
      HabitsCompanion.insert(
        title: 'Morning Jog',
        description: const Value('30 minutes run'),
        area: LifeArea.health,
        currentStreak: const Value(5),
        bestStreak: const Value(10),
      ),
    ];
  }

  static List<GoalsCompanion> goals(DateTime now) {
    return [
      GoalsCompanion.insert(
        title: 'Learn Flutter',
        description: const Value('Master Riverpod and Drift'),
        area: LifeArea.school,
        weeklyTarget: const Value(5),
        progress: const Value(2),
        milestones: const [],
      ),
    ];
  }

  static List<NotesCompanion> notes() {
    return [
      NotesCompanion.insert(
        title: 'Ideas',
        content: 'App idea: AI organizer',
        area: LifeArea.personal,
      ),
    ];
  }

  static List<ChecklistsCompanion> checklists() {
    return [
      ChecklistsCompanion.insert(
        title: 'Travel Packing',
        items: [ChecklistItem(label: 'Passport'), ChecklistItem(label: 'Charger')],
        area: LifeArea.personal,
      ),
    ];
  }

  static List<MoodEntriesCompanion> moods(DateTime now) {
    return [
      MoodEntriesCompanion.insert(
        mood: 4,
        energy: 3,
        date: Value(now.subtract(const Duration(days: 1))),
        note: const Value('Good day'),
      ),
    ];
  }

  static List<HealthEntriesCompanion> health(DateTime now) {
    return [
      HealthEntriesCompanion.insert(
        sleepHours: 7.5,
        waterCups: 8,
        exerciseMinutes: 45,
        date: Value(now.subtract(const Duration(days: 1))),
      ),
    ];
  }
}
