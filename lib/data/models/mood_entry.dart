import 'package:isar/isar.dart';

part 'mood_entry.g.dart';

@collection
class MoodEntry {
  MoodEntry({
    this.id = Isar.autoIncrement,
    required this.date,
    required this.mood,
    required this.energy,
    this.note,
  });

  Id id;
  DateTime date;
  int mood; // 1-5
  int energy; // 1-5
  String? note;

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date.toIso8601String(),
        'mood': mood,
        'energy': energy,
        'note': note,
      };

  factory MoodEntry.fromJson(Map<String, dynamic> json) => MoodEntry(
        id: json['id'] as int? ?? Isar.autoIncrement,
        date: DateTime.parse(json['date'] as String),
        mood: json['mood'] as int? ?? 3,
        energy: json['energy'] as int? ?? 3,
        note: json['note'] as String?,
      );
}
