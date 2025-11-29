import 'package:isar/isar.dart';

import 'life_area.dart';
import 'recurrence_rule.dart';
import 'reminder.dart';
import 'task_priority.dart';

part 'task.g.dart';

enum TaskStatus { open, inProgress, done, later }

@collection
class Task {
  Task({
    this.id = Isar.autoIncrement,
    required this.title,
    this.description,
    this.priority = TaskPriority.medium,
    this.status = TaskStatus.open,
    this.dueDate,
    this.area = LifeArea.personal,
    this.recurrence,
    this.reminder,
    this.subtasks = const [],
  });

  Id id;
  String title;
  String? description;
  @Enumerated(EnumType.name)
  TaskPriority priority;
  @Enumerated(EnumType.name)
  TaskStatus status;
  DateTime? dueDate;
  @Enumerated(EnumType.name)
  LifeArea area;
  RecurrenceRule? recurrence;
  Reminder? reminder;
  List<SubTask> subtasks;
  DateTime createdAt = DateTime.now();

  double get completion {
    if (subtasks.isEmpty) return status == TaskStatus.done ? 1 : 0;
    final completed = subtasks.where((s) => s.isDone).length;
    return completed / subtasks.length;
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'priority': priority.name,
        'status': status.name,
        'dueDate': dueDate?.toIso8601String(),
        'area': area.name,
        'recurrence': recurrence?.toJson(),
        'reminder': reminder?.toJson(),
        'subtasks': subtasks.map((e) => e.toJson()).toList(),
        'createdAt': createdAt.toIso8601String(),
      };

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['id'] as int? ?? Isar.autoIncrement,
        title: json['title'] as String? ?? '',
        description: json['description'] as String?,
        priority: TaskPriority.values.firstWhere(
          (p) => p.name == json['priority'],
          orElse: () => TaskPriority.medium,
        ),
        status: TaskStatus.values.firstWhere(
          (p) => p.name == json['status'],
          orElse: () => TaskStatus.open,
        ),
        dueDate: json['dueDate'] != null ? DateTime.tryParse(json['dueDate'] as String) : null,
        area: LifeArea.values.firstWhere(
          (a) => a.name == json['area'],
          orElse: () => LifeArea.personal,
        ),
        recurrence: json['recurrence'] != null ? RecurrenceRule.fromJson(Map<String, dynamic>.from(json['recurrence'] as Map)) : null,
        reminder: json['reminder'] != null ? Reminder.fromJson(Map<String, dynamic>.from(json['reminder'] as Map)) : null,
        subtasks: (json['subtasks'] as List<dynamic>? ?? [])
            .map((e) => SubTask.fromJson(Map<String, dynamic>.from(e as Map)))
            .toList(),
      )
        ..createdAt = json['createdAt'] != null
            ? DateTime.tryParse(json['createdAt'] as String) ?? DateTime.now()
            : DateTime.now();
}

@embedded
class SubTask {
  SubTask({this.title = '', this.isDone = false});
  String title;
  bool isDone;

  Map<String, dynamic> toJson() => {
        'title': title,
        'isDone': isDone,
      };

  factory SubTask.fromJson(Map<String, dynamic> json) => SubTask(
        title: json['title'] as String? ?? '',
        isDone: json['isDone'] as bool? ?? false,
      );
}
