import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/models.dart';
import '../../data/repositories/organizer_repository.dart';

final organizerControllerProvider = AsyncNotifierProvider<OrganizerController, OrganizerSnapshot>(OrganizerController.new);

class OrganizerController extends AsyncNotifier<OrganizerSnapshot> {
  @override
  Future<OrganizerSnapshot> build() => ref.read(organizerRepositoryProvider).loadSnapshot();

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref.read(organizerRepositoryProvider).loadSnapshot());
  }

  Future<void> toggleTask(Task task) async {
    final newStatus = task.status == TaskStatus.done ? TaskStatus.open : TaskStatus.done;
    await ref.read(organizerRepositoryProvider).updateTaskStatus(task.id, newStatus);
    await refresh();
  }

  Future<void> rescheduleTask(Task task, DateTime newDate) async {
    await ref.read(organizerRepositoryProvider).rescheduleTask(task.id, newDate);
    await refresh();
  }

  Future<void> moveTaskLater(Task task) async {
    await ref.read(organizerRepositoryProvider).moveTaskToLater(task.id);
    await refresh();
  }

  Future<void> completeHabit(Habit habit, {required bool completed}) async {
    await ref.read(organizerRepositoryProvider).saveHabitCompletion(habit, completed: completed);
    await refresh();
  }

  Future<void> logMood(int mood, int energy) async {
    final entry = MoodEntry(date: DateTime.now(), mood: mood, energy: energy);
    await ref.read(organizerRepositoryProvider).saveMood(entry);
    await refresh();
  }
}

final todayTasksProvider = FutureProvider<List<Task>>((ref) async {
  final repo = ref.read(organizerRepositoryProvider);
  return repo.tasksForDate(DateTime.now());
});

final todayEventsProvider = FutureProvider<List<CalendarEvent>>((ref) async {
  final repo = ref.read(organizerRepositoryProvider);
  return repo.eventsForDate(DateTime.now());
});

final globalSearchProvider = FutureProvider.family<List<String>, String>((ref, query) async {
  final repo = ref.read(organizerRepositoryProvider);
  return repo.globalSearch(query);
});
