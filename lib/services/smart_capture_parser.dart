import 'package:intl/intl.dart';

import '../data/models/models.dart';

class SmartCaptureResult {
  SmartCaptureResult({
    required this.title,
    required this.type,
    this.suggestedDate,
    this.priority = TaskPriority.medium,
    this.area = LifeArea.personal,
  });

  final String title;
  final String type; // task | event | habit | note
  final DateTime? suggestedDate;
  final TaskPriority priority;
  final LifeArea area;
}

class SmartCaptureParser {
  SmartCaptureResult parse(String input) {
    final lower = input.toLowerCase();
    final now = DateTime.now();

    DateTime? date;
    if (lower.contains('tomorrow')) {
      date = now.add(const Duration(days: 1));
    } else if (lower.contains('today')) {
      date = now;
    }

    final timeMatch = RegExp(r'(\d{1,2})(:?)(\d{2})?\s?(am|pm)?').firstMatch(lower);
    if (timeMatch != null) {
      final hour = int.tryParse(timeMatch.group(1) ?? '0') ?? 0;
      final minute = int.tryParse(timeMatch.group(3) ?? '0') ?? 0;
      final ampm = timeMatch.group(4);
      var parsedHour = hour;
      if (ampm == 'pm' && hour < 12) parsedHour += 12;
      if (ampm == 'am' && hour == 12) parsedHour = 0;
      final base = date ?? now;
      date = DateTime(base.year, base.month, base.day, parsedHour, minute);
    }

    final type = lower.contains('meet') || lower.contains('call') || lower.contains('event')
        ? 'event'
        : lower.contains('habit') || lower.contains('routine')
            ? 'habit'
            : lower.contains('note')
                ? 'note'
                : 'task';

    final priority = lower.contains('urgent') || lower.contains('high')
        ? TaskPriority.high
        : lower.contains('low')
            ? TaskPriority.low
            : TaskPriority.medium;

    final area = _inferArea(lower);

    return SmartCaptureResult(
      title: toTitleCase(input.replaceAll(RegExp(r'(today|tomorrow)', caseSensitive: false), '').trim()),
      type: type,
      suggestedDate: date,
      priority: priority,
      area: area,
    );
  }

  LifeArea _inferArea(String lower) {
    if (lower.contains('class') || lower.contains('exam') || lower.contains('study')) return LifeArea.school;
    if (lower.contains('work') || lower.contains('client') || lower.contains('sprint')) return LifeArea.work;
    if (lower.contains('gym') || lower.contains('run') || lower.contains('doctor')) return LifeArea.health;
    if (lower.contains('home') || lower.contains('clean')) return LifeArea.home;
    return LifeArea.personal;
  }

  String toTitleCase(String text) => toBeginningOfSentenceCase(text) ?? text;
}
