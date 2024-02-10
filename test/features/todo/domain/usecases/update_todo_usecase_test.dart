import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_tdd_clean/core/failures/failures.dart';
import 'package:todo_tdd_clean/features/todo/domain/entities/todo_entity.dart';
import 'package:todo_tdd_clean/features/todo/domain/repositories/todo_repository.dart';
import 'package:todo_tdd_clean/features/todo/domain/usecases/update_todo_usecase.dart';

import '../../../../helper/test_helper.mocks.dart';

// TEST SCENARIOS USE CASE
// 1. when use case is called it should return list of todo
// 2. when use case is called it should return failure

void main() {
  late TodoRepository mockTodoRepository;
  late UpdateTodoUseCase updateTodoUseCase;
  setUp(() {
    mockTodoRepository = MockTodoRepository();
    updateTodoUseCase = UpdateTodoUseCase(mockTodoRepository);
  });

  final TodoEntity todo = TodoEntity(
    id: '1',
    title: "title",
    isCompleted: true,
    createdAt: DateTime.parse('2024-02-09T23:52:30.688908'),
    updatedAt: DateTime.parse('2024-02-09T23:52:30.688908'),
  );

  const ServerFailure serverFailure = ServerFailure(errorMessage: 'error');

  group('update todo use case test', () {
    test('when update todo is called it should return  todo', () async {
      // ARRANGE
      when(mockTodoRepository.updateTodo(todo)).thenAnswer((_) async => Right(todo));
      // ACT
      final res = await updateTodoUseCase.execute(todo);
      // ASSERT
      expect(res, Right(todo));
    });

    test(' when update todo use case is called it should return failure', () async {
      // ARRANGE
      when(mockTodoRepository.updateTodo(todo)).thenAnswer((_) async => left(serverFailure));
      // ACT
      final res = await updateTodoUseCase.execute(todo);
      // ASSERT
      expect(res, left(serverFailure));
    });
  });
}
