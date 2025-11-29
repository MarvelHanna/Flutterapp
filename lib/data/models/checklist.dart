import 'package:isar/isar.dart';

import 'life_area.dart';

part 'checklist.g.dart';

@collection
class Checklist {
  Checklist({
    this.id = Isar.autoIncrement,
    required this.title,
    this.items = const [],
    this.area = LifeArea.home,
  });

  Id id;
  String title;
  List<ChecklistItem> items;
  @Enumerated(EnumType.name)
  LifeArea area;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'items': items.map((e) => e.toJson()).toList(),
        'area': area.name,
      };

  factory Checklist.fromJson(Map<String, dynamic> json) => Checklist(
        id: json['id'] as int? ?? Isar.autoIncrement,
        title: json['title'] as String? ?? '',
        items: (json['items'] as List<dynamic>? ?? [])
            .map((e) => ChecklistItem.fromJson(Map<String, dynamic>.from(e as Map)))
            .toList(),
        area: LifeArea.values.firstWhere((a) => a.name == json['area'], orElse: () => LifeArea.home),
      );
}

@embedded
class ChecklistItem {
  ChecklistItem({this.label = '', this.done = false});
  String label;
  bool done;

  Map<String, dynamic> toJson() => {'label': label, 'done': done};

  factory ChecklistItem.fromJson(Map<String, dynamic> json) => ChecklistItem(
        label: json['label'] as String? ?? '',
        done: json['done'] as bool? ?? false,
      );
}
