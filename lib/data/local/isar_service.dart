import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/models.dart';
import 'seed_data.dart';

final isarServiceProvider = Provider<IsarService>((ref) => throw UnimplementedError('IsarService not initialized'));

class IsarService {
  IsarService(this.isar);
  final Isar isar;

  static Future<IsarService> init() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [
        TaskSchema,
        CalendarEventSchema,
        HabitSchema,
        GoalSchema,
        NoteSchema,
        ChecklistSchema,
        MoodEntrySchema,
        HealthEntrySchema,
      ],
      directory: dir.path,
    );

    final service = IsarService(isar);
    await service._seedIfNeeded();
    return service;
  }

  Future<void> _seedIfNeeded() async {
    final taskCount = await isar.tasks.count();
    if (taskCount > 0) return;
    final now = DateTime.now();
    await isar.writeTxn(() async {
      await isar.tasks.putAll(SeedData.tasks(now));
      await isar.calendarEvents.putAll(SeedData.events(now));
      await isar.habits.putAll(SeedData.habits());
      await isar.goals.putAll(SeedData.goals(now));
      await isar.notes.putAll(SeedData.notes());
      await isar.checklists.putAll(SeedData.checklists());
      await isar.moodEntrys.putAll(SeedData.moods(now));
      await isar.healthEntrys.putAll(SeedData.health(now));
    });
  }
}
