import 'package:uuid/uuid.dart';

import '../models/models.dart';

class SeedData {
  SeedData._();
  static final _uuid = const Uuid();

  static List<Task> tasks(DateTime now) => [
        Task(
          id: _uuid.v4().hashCode,
          title: 'Finish research summary',
          description: 'Compile sources and submit to advisor',
          priority: TaskPriority.high,
          status: TaskStatus.inProgress,
          dueDate: now.add(const Duration(hours: 6)),
          area: LifeArea.school,
          subtasks: [
            SubTask(title: 'Outline key points', isDone: true),
            SubTask(title: 'Write abstract'),
            SubTask(title: 'Send for review'),
          ],
          recurrence: RecurrenceRule(frequency: RecurrenceFrequency.none),
          reminder: Reminder(scheduledFor: now.add(const Duration(hours: 4))),
        ),
        Task(
          id: _uuid.v4().hashCode,
          title: 'Deep work block',
          description: '90 min sprint for capstone build',
          priority: TaskPriority.medium,
          status: TaskStatus.open,
          dueDate: now.add(const Duration(hours: 2)),
          area: LifeArea.work,
          recurrence: RecurrenceRule(frequency: RecurrenceFrequency.daily),
          reminder: Reminder(scheduledFor: now.add(const Duration(hours: 1, minutes: 30))),
        ),
        Task(
          id: _uuid.v4().hashCode,
          title: 'Meal prep',
          priority: TaskPriority.low,
          status: TaskStatus.later,
          dueDate: now.add(const Duration(days: 1)),
          area: LifeArea.health,
          subtasks: [SubTask(title: 'Plan menu'), SubTask(title: 'Grocery run')],
        ),
      ];

  static List<CalendarEvent> events(DateTime now) => [
        CalendarEvent(
          id: _uuid.v4().hashCode,
          title: 'Product sync',
          start: DateTime(now.year, now.month, now.day, 10, 0),
          end: DateTime(now.year, now.month, now.day, 11, 0),
          location: 'Video',
          travelBufferMinutes: 0,
          notes: 'Share roadmap + blockers',
          area: LifeArea.work,
          reminder: Reminder(scheduledFor: DateTime(now.year, now.month, now.day, 9, 45)),
        ),
        CalendarEvent(
          id: _uuid.v4().hashCode,
          title: 'Gym + cooldown',
          start: DateTime(now.year, now.month, now.day, 18, 0),
          end: DateTime(now.year, now.month, now.day, 19, 15),
          location: 'Local gym',
          travelBufferMinutes: 15,
          area: LifeArea.health,
        ),
      ];

  static List<Habit> habits() => [
        Habit(
          id: _uuid.v4().hashCode,
          title: 'Morning walk',
          description: '20 minutes sunlight and stretch',
          recurrence: RecurrenceRule(frequency: RecurrenceFrequency.daily),
          area: LifeArea.health,
          currentStreak: 4,
          bestStreak: 10,
          graceDays: 1,
        ),
        Habit(
          id: _uuid.v4().hashCode,
          title: 'Inbox zero sweep',
          recurrence: RecurrenceRule(frequency: RecurrenceFrequency.weekly, interval: 2),
          area: LifeArea.work,
          currentStreak: 1,
          bestStreak: 6,
        ),
      ];

  static List<Goal> goals(DateTime now) => [
        Goal(
          id: _uuid.v4().hashCode,
          title: 'Ship MVP',
          description: 'Get organizer beta in the hands of 10 testers',
          area: LifeArea.work,
          weeklyTarget: 3,
          progress: 5,
          milestones: [
            GoalMilestone(label: 'Research complete', targetDate: now.add(const Duration(days: 7)), isAchieved: true),
            GoalMilestone(label: 'Prototype ready', targetDate: now.add(const Duration(days: 30))),
            GoalMilestone(label: 'Beta feedback', targetDate: now.add(const Duration(days: 90))),
          ],
        ),
        Goal(
          id: _uuid.v4().hashCode,
          title: '13-week strength block',
          area: LifeArea.health,
          weeklyTarget: 4,
          progress: 8,
          milestones: [
            GoalMilestone(label: 'Week 1-4 consistency', targetDate: now.add(const Duration(days: 21)), isAchieved: true),
            GoalMilestone(label: 'Week 5-8 volume', targetDate: now.add(const Duration(days: 56))),
            GoalMilestone(label: 'Week 9-13 peak', targetDate: now.add(const Duration(days: 91))),
          ],
        ),
      ];

  static List<Note> notes() => [
        Note(
          id: _uuid.v4().hashCode,
          title: 'Weekly review template',
          content:
              '- What moved the needle?\n- What felt heavy?\n- Where did time leak?\n- Plan: move, delete, delegate, schedule with buffers.',
          area: LifeArea.personal,
        ),
        Note(
          id: _uuid.v4().hashCode,
          title: 'Travel packing list link',
          content: 'Tie this to home checklist + doc link.',
          area: LifeArea.home,
        ),
      ];

  static List<Checklist> checklists() => [
        Checklist(
          id: _uuid.v4().hashCode,
          title: 'One-tap reset',
          area: LifeArea.home,
          items: [
            ChecklistItem(label: 'Reset desk', done: false),
            ChecklistItem(label: 'Prep clothes', done: true),
            ChecklistItem(label: 'Fill water bottle', done: false),
          ],
        ),
      ];

  static List<MoodEntry> moods(DateTime now) => [
        MoodEntry(id: _uuid.v4().hashCode, date: now, mood: 4, energy: 3, note: 'Focused AM'),
        MoodEntry(id: _uuid.v4().hashCode, date: now.subtract(const Duration(days: 1)), mood: 3, energy: 4, note: 'Long meetings'),
      ];

  static List<HealthEntry> health(DateTime now) => [
        HealthEntry(id: _uuid.v4().hashCode, date: now, sleepHours: 7.5, waterCups: 9),
        HealthEntry(id: _uuid.v4().hashCode, date: now.subtract(const Duration(days: 1)), sleepHours: 6.5, waterCups: 7),
      ];
}
