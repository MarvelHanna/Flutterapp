enum TaskPriority { low, medium, high }

extension TaskPriorityX on TaskPriority {
  String get label => name[0].toUpperCase() + name.substring(1);
}
