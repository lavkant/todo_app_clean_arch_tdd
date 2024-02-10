import 'package:dartz/dartz.dart';
import 'package:todo_tdd_clean/core/failures/failures.dart';
import 'package:todo_tdd_clean/features/todo/domain/entities/todo_entity.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<TodoEntity>>> addTodo(TodoEntity todo);
  Future<Either<Failure, TodoEntity>> deleteTodo(TodoEntity todo);
  Future<Either<Failure, TodoEntity>> updateTodo(TodoEntity todo);
  Future<Either<Failure, TodoEntity>> getTodo(String id);
  Future<Either<Failure, List<TodoEntity>>> getAllTodo();
  Future<Either<Failure, void>> deleteAllTodo();
}
