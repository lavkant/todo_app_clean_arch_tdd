import 'package:dartz/dartz.dart';
import 'package:todo_tdd_clean/core/failures/failures.dart';
import 'package:todo_tdd_clean/features/todo/data/datasources/todo_datasource.dart';
import 'package:todo_tdd_clean/features/todo/data/models/todo_model.dart';
import 'package:todo_tdd_clean/features/todo/domain/entities/todo_entity.dart';
import 'package:todo_tdd_clean/features/todo/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl extends TodoRepository {
  final TodoDataSource dataSource;

  TodoRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<TodoEntity>>> addTodo(TodoEntity todo) async {
    try {
      final result = await dataSource.addTodo(TodoModel(
        id: todo.id,
        title: todo.title,
        isCompleted: todo.isCompleted,
        createdAt: todo.createdAt,
        updatedAt: todo.updatedAt,
      ));
      return Right(result.map((e) => e.toEntity()).toList());
    } on Exception {
      return const Left(ServerFailure(errorMessage: 'Server Failure'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAllTodo() async {
    try {
      dataSource.deleteAllTodo();
      return const Right(null);
    } on Exception {
      return const Left(ServerFailure(errorMessage: 'Server Failure'));
    }
  }

  @override
  Future<Either<Failure, TodoEntity>> deleteTodo(TodoEntity todo) async {
    try {
      final result = await dataSource.deleteTodo(TodoModel(
        id: todo.id,
        title: todo.title,
        isCompleted: todo.isCompleted,
        createdAt: todo.createdAt,
        updatedAt: todo.updatedAt,
      ));
      return Right(result.toEntity());
    } on Exception {
      return const Left(ServerFailure(errorMessage: 'Server Failure'));
    }
  }

  @override
  Future<Either<Failure, List<TodoEntity>>> getAllTodo() async {
    try {
      final result = await dataSource.getAllTodo();

      return Right(result.map((e) => e.toEntity()).toList());
    } on Exception {
      return const Left(ServerFailure(errorMessage: 'Server Failure'));
    }
  }

  @override
  Future<Either<Failure, TodoEntity>> getTodo(String id) async {
    try {
      final result = await dataSource.getTodo(id);
      return Right(result.toEntity());
    } on Exception {
      return const Left(ServerFailure(errorMessage: 'Server Failure'));
    }
  }

  @override
  Future<Either<Failure, TodoEntity>> updateTodo(TodoEntity todo) async {
    try {
      final result = await dataSource.updateTodo(TodoModel(
        id: todo.id,
        title: todo.title,
        isCompleted: todo.isCompleted,
        createdAt: todo.createdAt,
        updatedAt: todo.updatedAt,
      ));
      return Right(result.toEntity());
    } on Exception {
      return const Left(ServerFailure(errorMessage: 'Server Failure'));
    }
  }
}
