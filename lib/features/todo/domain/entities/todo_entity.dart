import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  final String id;
  final String title;
  final bool? isCompleted;
  final DateTime createdAt;
  final DateTime updatedAt;

  const TodoEntity({
    required this.id,
    required this.title,
    required this.isCompleted,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id, title, isCompleted, createdAt, updatedAt];
}
