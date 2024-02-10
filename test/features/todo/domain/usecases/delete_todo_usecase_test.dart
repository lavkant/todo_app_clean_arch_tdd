import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_tdd_clean/core/failures/failures.dart';
import 'package:todo_tdd_clean/features/todo/domain/entities/todo_entity.dart';
import 'package:todo_tdd_clean/features/todo/domain/repositories/todo_repository.dart';
import 'package:todo_tdd_clean/features/todo/domain/usecases/delete_todo_usecase.dart';

import '../../../../helper/test_helper.mocks.dart';

// TEST SCENARIOS USE CASE
// 1. when use case is called it should return todo
// 2. when use case is called it should return failure

void main() {
  late TodoRepository mockTodoRepository;
  late DeleteTodoUseCase deleteTodoUseCase;
  setUp(() {
    mockTodoRepository = MockTodoRepository();
    deleteTodoUseCase = DeleteTodoUseCase(mockTodoRepository);
  });

  final TodoEntity todo = TodoEntity(
    id: '1',
    title: "title",
    isCompleted: true,
    createdAt: DateTime.parse('2024-02-09T23:52:30.688908'),
    updatedAt: DateTime.parse('2024-02-09T23:52:30.688908'),
  );

  const ServerFailure serverFailure = ServerFailure(errorMessage: 'error');

  group('delete todo use case test', () {
    test('when add todo is called it should return list of todos', () async {
      // ARRANGE
      when(mockTodoRepository.deleteTodo(todo)).thenAnswer((_) async => Right(todo));
      // ACT
      final res = await deleteTodoUseCase.execute(todo);
      // ASSERT

      expect(res, Right(todo));
    });

    test(' when use case is called it should return failure', () async {
      // ARRANGE
      when(mockTodoRepository.deleteTodo(todo)).thenAnswer((_) async => left(serverFailure));
      // ACT
      final res = await deleteTodoUseCase.execute(todo);
      // ASSERT
      expect(res, left(serverFailure));
    });
  });
}
