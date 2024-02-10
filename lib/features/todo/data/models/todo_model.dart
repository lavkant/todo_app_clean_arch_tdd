import 'package:todo_tdd_clean/features/todo/domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  @override
  final String id;
  @override
  final String title;
  @override
  final bool? isCompleted;

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  const TodoModel({
    required this.id,
    required this.title,
    required this.isCompleted,
    required this.createdAt,
    required this.updatedAt,
  }) : super(
          id: id,
          title: title,
          isCompleted: isCompleted ?? false,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  // FROM JSON
  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['title'],
      isCompleted: json['isCompleted'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  // TO JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isCompleted': isCompleted,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  // TO ENTITY
  TodoEntity toEntity() {
    return TodoEntity(
      id: id,
      title: title,
      isCompleted: isCompleted,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
