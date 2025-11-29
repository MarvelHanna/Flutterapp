import 'package:isar/isar.dart';

import 'life_area.dart';

part 'goal.g.dart';

@collection
class Goal {
  Goal({
    this.id = Isar.autoIncrement,
    required this.title,
    this.description,
    this.area = LifeArea.personal,
    this.weeklyTarget = 1,
    this.milestones = const [],
    this.progress = 0,
  });

  Id id;
  String title;
  String? description;
  @Enumerated(EnumType.name)
  LifeArea area;
  int weeklyTarget;
  int progress;
  List<GoalMilestone> milestones;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'area': area.name,
        'weeklyTarget': weeklyTarget,
        'progress': progress,
        'milestones': milestones.map((e) => e.toJson()).toList(),
      };

  factory Goal.fromJson(Map<String, dynamic> json) => Goal(
        id: json['id'] as int? ?? Isar.autoIncrement,
        title: json['title'] as String? ?? '',
        description: json['description'] as String?,
        area: LifeArea.values.firstWhere((a) => a.name == json['area'], orElse: () => LifeArea.personal),
        weeklyTarget: json['weeklyTarget'] as int? ?? 1,
        progress: json['progress'] as int? ?? 0,
        milestones: (json['milestones'] as List<dynamic>? ?? [])
            .map((e) => GoalMilestone.fromJson(Map<String, dynamic>.from(e as Map)))
            .toList(),
      );
}

@embedded
class GoalMilestone {
  GoalMilestone({this.label = '', this.targetDate, this.isAchieved = false});
  String label;
  DateTime? targetDate;
  bool isAchieved;

  Map<String, dynamic> toJson() => {
        'label': label,
        'targetDate': targetDate?.toIso8601String(),
        'isAchieved': isAchieved,
      };

  factory GoalMilestone.fromJson(Map<String, dynamic> json) => GoalMilestone(
        label: json['label'] as String? ?? '',
        targetDate: json['targetDate'] != null ? DateTime.tryParse(json['targetDate'] as String) : null,
        isAchieved: json['isAchieved'] as bool? ?? false,
      );
}
