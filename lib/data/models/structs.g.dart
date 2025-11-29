// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'structs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubTask _$SubTaskFromJson(Map<String, dynamic> json) => SubTask(
      title: json['title'] as String? ?? '',
      isDone: json['isDone'] as bool? ?? false,
    );

Map<String, dynamic> _$SubTaskToJson(SubTask instance) => <String, dynamic>{
      'title': instance.title,
      'isDone': instance.isDone,
    };

GoalMilestone _$GoalMilestoneFromJson(Map<String, dynamic> json) =>
    GoalMilestone(
      label: json['label'] as String? ?? '',
      targetDate: json['targetDate'] == null
          ? null
          : DateTime.parse(json['targetDate'] as String),
      isAchieved: json['isAchieved'] as bool? ?? false,
    );

Map<String, dynamic> _$GoalMilestoneToJson(GoalMilestone instance) =>
    <String, dynamic>{
      'label': instance.label,
      'targetDate': instance.targetDate?.toIso8601String(),
      'isAchieved': instance.isAchieved,
    };

ChecklistItem _$ChecklistItemFromJson(Map<String, dynamic> json) =>
    ChecklistItem(
      label: json['label'] as String? ?? '',
      done: json['done'] as bool? ?? false,
    );

Map<String, dynamic> _$ChecklistItemToJson(ChecklistItem instance) =>
    <String, dynamic>{
      'label': instance.label,
      'done': instance.done,
    };
