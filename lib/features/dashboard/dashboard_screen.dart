import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/models.dart';
import '../../data/repositories/organizer_repository.dart';
import '../shared/providers.dart';
import '../shared/widgets/section_card.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snapshot = ref.watch(organizerControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () => ref.read(organizerControllerProvider.notifier).refresh(),
          )
        ],
      ),
      body: snapshot.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (data) {
          final areaLoad = data.areaLoad;
          final latestMood = data.moods.isNotEmpty ? data.moods.first : null;
          final latestHealth = data.healthEntries.isNotEmpty ? data.healthEntries.first : null;

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              SectionCard(
                title: 'Life areas',
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: areaLoad.entries
                      .map(
                        (entry) => Chip(
                          label: Text('${entry.key.label} • ${entry.value} focus items'),
                          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                          labelStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),
                        ),
                      )
                      .toList(),
                ),
              ),
              SectionCard(
                title: 'Goals & progress',
                child: Column(
                  children: data.goals
                      .map(
                        (goal) => ListTile(
                          dense: true,
                          title: Text(goal.title),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Weekly target: ${goal.weeklyTarget} • Progress: ${goal.progress}'),
                              const SizedBox(height: 6),
                              LinearProgressIndicator(
                                value: (goal.progress % goal.weeklyTarget) / goal.weeklyTarget.clamp(1, 999),
                              ),
                            ],
                          ),
                          trailing: Text(goal.area.label),
                        ),
                      )
                      .toList(),
                ),
              ),
              SectionCard(
                title: 'Quick lists',
                child: Column(
                  children: data.checklists
                      .map(
                        (list) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(list.title, style: Theme.of(context).textTheme.titleSmall),
                            ...list.items.map(
                              (item) => CheckboxListTile(
                                dense: true,
                                value: item.done,
                                title: Text(item.label),
                                onChanged: (val) async {
                                  item.done = val ?? false;
                                  await ref.read(organizerRepositoryProvider).saveChecklist(list);
                                  await ref.read(organizerControllerProvider.notifier).refresh();
                                },
                              ),
                            ),
                            const Divider(),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
              SectionCard(
                title: 'Notes',
                child: Column(
                  children: data.notes
                      .take(3)
                      .map(
                        (note) => ListTile(
                          leading: const Icon(Icons.note_rounded),
                          title: Text(note.title),
                          subtitle: Text(note.content, maxLines: 2, overflow: TextOverflow.ellipsis),
                        ),
                      )
                      .toList(),
                ),
              ),
              SectionCard(
                title: 'Health',
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Sleep'),
                          const SizedBox(height: 6),
                          Text(latestHealth != null ? '${latestHealth.sleepHours.toStringAsFixed(1)} hrs' : '—'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Water'),
                          const SizedBox(height: 6),
                          Text(latestHealth != null ? '${latestHealth.waterCups} cups' : '—'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SectionCard(
                title: 'Mood & energy',
                child: latestMood == null
                    ? const Text('No entries yet')
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mood: ${latestMood.mood}/5   Energy: ${latestMood.energy}/5'),
                          const SizedBox(height: 4),
                          if (latestMood.note != null) Text(latestMood.note!),
                          const SizedBox(height: 8),
                          FilledButton.tonal(
                            onPressed: () => ref.read(organizerControllerProvider.notifier).logMood(4, 4),
                            child: const Text('Quick log neutral'),
                          )
                        ],
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
