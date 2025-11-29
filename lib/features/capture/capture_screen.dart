import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/models.dart';
import '../../data/repositories/organizer_repository.dart';
import '../../services/smart_capture_parser.dart';
import '../../services/speech_service.dart';
import '../shared/providers.dart';

class CaptureScreen extends ConsumerStatefulWidget {
  const CaptureScreen({super.key});

  @override
  ConsumerState<CaptureScreen> createState() => _CaptureScreenState();
}

class _CaptureScreenState extends ConsumerState<CaptureScreen> {
  final _controller = TextEditingController();
  final _parser = SmartCaptureParser();
  SmartCaptureResult? _parsed;
  bool _listening = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _startVoice() async {
    final speech = ref.read(speechServiceProvider);
    final ok = await speech.init();
    if (!ok) return;
    setState(() => _listening = true);
    await speech.start((text) {
      _controller.text = text;
      setState(() => _parsed = _parser.parse(text));
    });
  }

  Future<void> _stopVoice() async {
    final speech = ref.read(speechServiceProvider);
    await speech.stop();
    setState(() => _listening = false);
  }

  Future<void> _save() async {
    final repo = ref.read(organizerRepositoryProvider);
    final parsed = _parsed ?? _parser.parse(_controller.text);
    if (_controller.text.trim().isEmpty) return;
    switch (parsed.type) {
      case 'event':
        final start = parsed.suggestedDate ?? DateTime.now().add(const Duration(hours: 1));
        await repo.saveEvent(
          CalendarEvent(
            id: 0,
            title: parsed.title,
            description: null,
            start: start,
            end: start.add(const Duration(hours: 1)),
            area: parsed.area,
            location: null,
            travelBufferMinutes: 0,
          ),
        );
        break;
      case 'habit':
        await repo.saveHabit(
          Habit(
            id: 0,
            title: parsed.title,
            description: null,
            recurrence: RecurrenceRule(frequency: RecurrenceFrequency.daily),
            area: parsed.area,
            currentStreak: 1,
            bestStreak: 0,
            graceDays: 1,
            catchUpAllowed: true,
            reminder: null,
          ),
        );
        break;
      case 'note':
        await repo.saveNote(Note(id: 0, title: parsed.title, content: _controller.text, area: parsed.area, createdAt: DateTime.now()));
        break;
      default:
        await repo.saveTask(
          Task(
            id: 0,
            title: parsed.title,
            description: null,
            priority: parsed.priority,
            status: TaskStatus.open,
            dueDate: parsed.suggestedDate ?? DateTime.now(),
            area: parsed.area,
            recurrence: null,
            reminder: null,
            subtasks: const [],
            createdAt: DateTime.now(),
          ),
        );
    }
    await ref.read(organizerControllerProvider.notifier).refresh();
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Captured and stored locally')),
      );
      _controller.clear();
      setState(() => _parsed = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Smart capture')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 3,
              decoration: const InputDecoration(labelText: 'Type or dictate', border: OutlineInputBorder()),
              onChanged: (value) => setState(() => _parsed = _parser.parse(value)),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: _save,
                  icon: const Icon(Icons.send_rounded),
                  label: const Text('Send to inbox'),
                ),
                const SizedBox(width: 12),
                OutlinedButton.icon(
                  onPressed: _listening ? _stopVoice : _startVoice,
                  icon: Icon(_listening ? Icons.stop_rounded : Icons.mic_rounded),
                  label: Text(_listening ? 'Stop' : 'Voice'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (_parsed != null)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Parsed as: ${_parsed!.type.toUpperCase()}', style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 4),
                      Text('Title: ${_parsed!.title}'),
                      if (_parsed!.suggestedDate != null) Text('When: ${_parsed!.suggestedDate}'),
                      Text('Area: ${_parsed!.area.label} • Priority: ${_parsed!.priority.label}'),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
