import 'package:isar/isar.dart';

import 'life_area.dart';

part 'note.g.dart';

@collection
class Note {
  Note({
    this.id = Isar.autoIncrement,
    required this.title,
    required this.content,
    this.area = LifeArea.personal,
  });

  Id id;
  String title;
  String content;
  @Enumerated(EnumType.name)
  LifeArea area;
  DateTime createdAt = DateTime.now();

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'area': area.name,
        'createdAt': createdAt.toIso8601String(),
      };

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json['id'] as int? ?? Isar.autoIncrement,
        title: json['title'] as String? ?? '',
        content: json['content'] as String? ?? '',
        area: LifeArea.values.firstWhere((a) => a.name == json['area'], orElse: () => LifeArea.personal),
      )
        ..createdAt = json['createdAt'] != null
            ? DateTime.tryParse(json['createdAt'] as String) ?? DateTime.now()
            : DateTime.now();
}
