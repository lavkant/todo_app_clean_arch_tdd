import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_tdd_clean/core/failures/failures.dart';
import 'package:todo_tdd_clean/features/todo/domain/entities/todo_entity.dart';
import 'package:todo_tdd_clean/features/todo/domain/repositories/todo_repository.dart';
import 'package:todo_tdd_clean/features/todo/domain/usecases/add_todo_usecase.dart';

import '../../../../helper/test_helper.mocks.dart';

// TEST SCENARIOS USE CASE
// 1. when use case is called it should return list of todo
// 2. when use case is called it should return failure

void main() {
  late TodoRepository mockTodoRepository;
  late AddTodoUseCase addTodoUseCase;
  setUp(() {
    mockTodoRepository = MockTodoRepository();
    addTodoUseCase = AddTodoUseCase(mockTodoRepository);
  });

  final List<TodoEntity> todos = [
    TodoEntity(
      id: '1',
      title: "title",
      isCompleted: true,
      createdAt: DateTime.parse('2024-02-09T23:52:30.688908'),
      updatedAt: DateTime.parse('2024-02-09T23:52:30.688908'),
    )
  ];

  final todo = TodoEntity(
    id: '1',
    title: "title",
    isCompleted: true,
    createdAt: DateTime.parse('2024-02-09T23:52:30.688908'),
    updatedAt: DateTime.parse('2024-02-09T23:52:30.688908'),
  );

  const ServerFailure serverFailure = ServerFailure(errorMessage: 'error');

  group('add todo use case test', () {
    test('when add todo is called it should return list of todos', () async {
      // ARRANGE
      when(mockTodoRepository.addTodo(todo)).thenAnswer((_) async => Right(todos));
      // ACT
      final res = await addTodoUseCase.execute(todo);
      // ASSERT

      expect(res, Right(todos));
    });

    test(' when use case is called it should return failure', () async {
      // ARRANGE
      when(mockTodoRepository.addTodo(todo)).thenAnswer((_) async => left(serverFailure));
      // ACT
      final res = await addTodoUseCase.execute(todo);
      // ASSERT
      expect(res, left(serverFailure));
    });
  });
}
