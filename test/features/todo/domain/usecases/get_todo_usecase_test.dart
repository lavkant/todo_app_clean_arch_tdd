import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_tdd_clean/core/failures/failures.dart';
import 'package:todo_tdd_clean/features/todo/domain/entities/todo_entity.dart';
import 'package:todo_tdd_clean/features/todo/domain/repositories/todo_repository.dart';
import 'package:todo_tdd_clean/features/todo/domain/usecases/get_todo_usecase.dart';

import '../../../../helper/test_helper.mocks.dart';

// TEST SCENARIOS USE CASE
// 1. when use case is called it should return list of todo
// 2. when use case is called it should return failure

void main() {
  late TodoRepository mockTodoRepository;
  late GetTodoUseCase getTodoUseCase;
  setUp(() {
    mockTodoRepository = MockTodoRepository();
    getTodoUseCase = GetTodoUseCase(mockTodoRepository);
  });

  final TodoEntity todo = TodoEntity(
    id: '1',
    title: "title",
    isCompleted: true,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  String id = '1';
  const ServerFailure serverFailure = ServerFailure(errorMessage: 'error');

  group('get todo use case test', () {
    test('when add todo is called it should return list of todos', () async {
      // ARRANGE
      when(mockTodoRepository.getTodo(id)).thenAnswer((_) async => Right(todo));
      // ACT
      final res = await getTodoUseCase.execute(id);
      // ASSERT

      expect(res, Right(todo));
    });

    test(' when use case is called it should return failure', () async {
      // ARRANGE
      when(mockTodoRepository.getTodo(id)).thenAnswer((_) async => const Left(serverFailure));

      // ACT
      final res = await getTodoUseCase.execute(id);
      // ASSERT
      expect(res, left(serverFailure));
    });
  });
}
