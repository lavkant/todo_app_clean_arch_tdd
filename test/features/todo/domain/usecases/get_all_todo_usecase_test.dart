import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_tdd_clean/core/failures/failures.dart';
import 'package:todo_tdd_clean/features/todo/domain/entities/todo_entity.dart';
import 'package:todo_tdd_clean/features/todo/domain/repositories/todo_repository.dart';
import 'package:todo_tdd_clean/features/todo/domain/usecases/get_all_todo_usecase.dart';

import '../../../../helper/test_helper.mocks.dart';

// TEST SCENARIOS USE CASE
// 1. when use case is called it should return list of todo
// 2. when use case is called it should return failure

void main() {
  late TodoRepository mockTodoRepository;
  late GetAllTodoUseCase getAllTodoUseCase;
  setUp(() {
    mockTodoRepository = MockTodoRepository();
    getAllTodoUseCase = GetAllTodoUseCase(mockTodoRepository);
  });

  final List<TodoEntity> todo = [
    TodoEntity(
      id: '1',
      title: "title",
      isCompleted: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    )
  ];

  const ServerFailure serverFailure = ServerFailure(errorMessage: 'error');

  group('get all todo use case test', () {
    test('when get all add todo is called it should return list of todos', () async {
      // ARRANGE
      when(mockTodoRepository.getAllTodo()).thenAnswer((_) async => Right(todo));
      // ACT
      final res = await getAllTodoUseCase.execute();
      // ASSERT

      expect(res, Right(todo));
    });

    test(' when get all  use case is called it should return failure', () async {
      // ARRANGE
      when(mockTodoRepository.getAllTodo()).thenAnswer((_) async => left(serverFailure));
      // ACT
      final res = await getAllTodoUseCase.execute();
      // ASSERT
      expect(res, left(serverFailure));
    });
  });
}
