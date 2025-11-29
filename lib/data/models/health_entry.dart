import 'package:isar/isar.dart';

part 'health_entry.g.dart';

@collection
class HealthEntry {
  HealthEntry({
    this.id = Isar.autoIncrement,
    required this.date,
    this.sleepHours = 7,
    this.waterCups = 8,
  });

  Id id;
  DateTime date;
  double sleepHours;
  int waterCups;

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date.toIso8601String(),
        'sleepHours': sleepHours,
        'waterCups': waterCups,
      };

  factory HealthEntry.fromJson(Map<String, dynamic> json) => HealthEntry(
        id: json['id'] as int? ?? Isar.autoIncrement,
        date: DateTime.parse(json['date'] as String),
        sleepHours: (json['sleepHours'] as num?)?.toDouble() ?? 7,
        waterCups: json['waterCups'] as int? ?? 8,
      );
}
