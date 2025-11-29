import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../data/models/models.dart';
import '../shared/providers.dart';
import '../shared/widgets/section_card.dart';

class TodayScreen extends ConsumerWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todayLabel = DateFormat('EEE, MMM d').format(DateTime.now());
    final tasks = ref.watch(todayTasksProvider);
    final events = ref.watch(todayEventsProvider);
    final snapshot = ref.watch(organizerControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Today • $todayLabel'),
        actions: [
          IconButton(
            icon: const Icon(Icons.checklist_rounded),
            onPressed: () => ref.read(organizerControllerProvider.notifier).logMood(4, 4),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => ref.read(organizerControllerProvider.notifier).refresh(),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            events.when(
              data: (data) => SectionCard(
                title: 'Agenda',
                child: Column(
                  children: data
                      .map(
                        (event) => ListTile(
                          leading: const Icon(Icons.event_rounded),
                          title: Text(event.title),
                          subtitle: Text(
                            '${DateFormat('hh:mm a').format(event.start)} - ${DateFormat('hh:mm a').format(event.end)}'
                            '${event.travelBufferMinutes > 0 ? ' (+${event.travelBufferMinutes}m travel)' : ''}',
                          ),
                          trailing: Text(event.area.label),
                        ),
                      )
                      .toList(),
                ),
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Text('Error loading events: $e'),
            ),
            tasks.when(
              data: (data) => SectionCard(
                title: 'Tasks due',
                child: Column(
                  children: data
                      .map(
                        (task) => CheckboxListTile(
                          value: task.status == TaskStatus.done,
                          onChanged: (_) => ref.read(organizerControllerProvider.notifier).toggleTask(task),
                          title: Text(task.title),
                          subtitle: Text(task.description ?? ''),
                          secondary: _priorityChip(context, task),
                        ),
                      )
                      .toList(),
                ),
              ),
              loading: () => const Padding(
                padding: EdgeInsets.all(24),
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (e, _) => Text('Error loading tasks: $e'),
            ),
            snapshot.when(
              data: (data) {
                final reviewCandidates = data.tasks.where((t) => t.status == TaskStatus.later).take(3).toList();
                return SectionCard(
                  title: 'Weekly review (Later bin)',
                  child: Column(
                    children: reviewCandidates
                        .map(
                          (task) => ListTile(
                            title: Text(task.title),
                            subtitle: Text(task.description ?? 'Flexible task'),
                            trailing: Wrap(
                              spacing: 8,
                              children: [
                                IconButton(
                                  tooltip: 'Reschedule tomorrow',
                                  icon: const Icon(Icons.calendar_today),
                                  onPressed: () => ref
                                      .read(organizerControllerProvider.notifier)
                                      .rescheduleTask(task, DateTime.now().add(const Duration(days: 1))),
                                ),
                                IconButton(
                                  tooltip: 'Move to today',
                                  icon: const Icon(Icons.arrow_upward_rounded),
                                  onPressed: () => ref
                                      .read(organizerControllerProvider.notifier)
                                      .rescheduleTask(task, DateTime.now()),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                );
              },
              loading: () => const SizedBox.shrink(),
              error: (e, _) => Text('Review error: $e'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _priorityChip(BuildContext context, Task task) {
    final colorScheme = Theme.of(context).colorScheme;
    Color bg;
    switch (task.priority) {
      case TaskPriority.high:
        bg = colorScheme.errorContainer;
        break;
      case TaskPriority.medium:
        bg = colorScheme.secondaryContainer;
        break;
      case TaskPriority.low:
        bg = colorScheme.tertiaryContainer;
        break;
    }
    return Chip(label: Text(task.priority.label), backgroundColor: bg);
  }
}
