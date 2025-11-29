import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../data/models/models.dart';
import '../shared/providers.dart';
import '../shared/widgets/section_card.dart';

class CalendarScreen extends ConsumerWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snapshot = ref.watch(organizerControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Calendar')),
      body: snapshot.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (data) {
          final byDay = <String, List<dynamic>>{};
          for (final event in data.events) {
            final key = DateFormat('y-MM-dd').format(event.start);
            byDay.putIfAbsent(key, () => []).add(event);
          }
          for (final task in data.tasks.where((t) => t.dueDate != null)) {
            final key = DateFormat('y-MM-dd').format(task.dueDate!);
            byDay.putIfAbsent(key, () => []).add(task);
          }
          final sortedKeys = byDay.keys.toList()..sort();

          return ListView(
            padding: const EdgeInsets.all(16),
            children: sortedKeys
                .map(
                  (key) => SectionCard(
                    title: DateFormat('EEEE, MMM d').format(DateTime.parse(key)),
                    child: Column(
                      children: byDay[key]!
                          .map(
                            (item) => item is CalendarEvent
                                ? ListTile(
                                    leading: const Icon(Icons.event_note_rounded),
                                    title: Text(item.title),
                                    subtitle: Text(
                                      '${DateFormat('hh:mm a').format(item.start)} - ${DateFormat('hh:mm a').format(item.end)}'
                                      '${item.travelBufferMinutes > 0 ? ' (+${item.travelBufferMinutes}m travel)' : ''}',
                                    ),
                                  )
                                : ListTile(
                                    leading: const Icon(Icons.check_circle_outline),
                                    title: Text(item.title),
                                    subtitle: const Text('Task'),
                                    trailing: item.dueDate != null
                                        ? Text(DateFormat('hh:mm a').format(item.dueDate!))
                                        : const SizedBox.shrink(),
                                  ),
                          )
                          .toList(),
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
