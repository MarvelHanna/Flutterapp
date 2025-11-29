import 'package:json_annotation/json_annotation.dart';

part 'structs.g.dart';

@JsonSerializable()
class SubTask {
  SubTask({this.title = '', this.isDone = false});
  String title;
  bool isDone;

  factory SubTask.fromJson(Map<String, dynamic> json) => _$SubTaskFromJson(json);
  Map<String, dynamic> toJson() => _$SubTaskToJson(this);
}

@JsonSerializable()
class GoalMilestone {
  GoalMilestone({this.label = '', this.targetDate, this.isAchieved = false});
  String label;
  DateTime? targetDate;
  bool isAchieved;

  factory GoalMilestone.fromJson(Map<String, dynamic> json) => _$GoalMilestoneFromJson(json);
  Map<String, dynamic> toJson() => _$GoalMilestoneToJson(this);
}

@JsonSerializable()
class ChecklistItem {
  ChecklistItem({this.label = '', this.done = false});
  String label;
  bool done;

  factory ChecklistItem.fromJson(Map<String, dynamic> json) => _$ChecklistItemFromJson(json);
  Map<String, dynamic> toJson() => _$ChecklistItemToJson(this);
}
