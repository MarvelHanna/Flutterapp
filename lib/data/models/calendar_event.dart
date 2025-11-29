import 'package:isar/isar.dart';

import 'life_area.dart';
import 'reminder.dart';

part 'calendar_event.g.dart';

@collection
class CalendarEvent {
  CalendarEvent({
    this.id = Isar.autoIncrement,
    required this.title,
    required this.start,
    required this.end,
    this.location,
    this.travelBufferMinutes = 0,
    this.notes,
    this.area = LifeArea.work,
    this.reminder,
    this.isAllDay = false,
  });

  Id id;
  String title;
  DateTime start;
  DateTime end;
  String? location;
  int travelBufferMinutes;
  String? notes;
  @Enumerated(EnumType.name)
  LifeArea area;
  Reminder? reminder;
  bool isAllDay;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'start': start.toIso8601String(),
        'end': end.toIso8601String(),
        'location': location,
        'travelBufferMinutes': travelBufferMinutes,
        'notes': notes,
        'area': area.name,
        'reminder': reminder?.toJson(),
        'isAllDay': isAllDay,
      };

  factory CalendarEvent.fromJson(Map<String, dynamic> json) => CalendarEvent(
        id: json['id'] as int? ?? Isar.autoIncrement,
        title: json['title'] as String? ?? '',
        start: DateTime.parse(json['start'] as String),
        end: DateTime.parse(json['end'] as String),
        location: json['location'] as String?,
        travelBufferMinutes: json['travelBufferMinutes'] as int? ?? 0,
        notes: json['notes'] as String?,
        area: LifeArea.values.firstWhere(
          (a) => a.name == json['area'],
          orElse: () => LifeArea.work,
        ),
        reminder: json['reminder'] != null ? Reminder.fromJson(Map<String, dynamic>.from(json['reminder'] as Map)) : null,
        isAllDay: json['isAllDay'] as bool? ?? false,
      );
}
