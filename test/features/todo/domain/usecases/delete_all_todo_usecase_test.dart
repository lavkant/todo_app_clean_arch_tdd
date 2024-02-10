import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_tdd_clean/core/failures/failures.dart';
import 'package:todo_tdd_clean/features/todo/domain/repositories/todo_repository.dart';
import 'package:todo_tdd_clean/features/todo/domain/usecases/delete_all_todo_usecase.dart';

import '../../../../helper/test_helper.mocks.dart';

// TEST SCENARIOS USE CASE
// 1. when use case is called it should return todo
// 2. when use case is called it should return failure

void main() {
  late TodoRepository mockTodoRepository;
  late DeleteAllTodoUseCase deleteAllTodoUseCase;
  setUp(() {
    mockTodoRepository = MockTodoRepository();
    deleteAllTodoUseCase = DeleteAllTodoUseCase(mockTodoRepository);
  });

  //

  const ServerFailure serverFailure = ServerFailure(errorMessage: 'error');

  group('delete all todo use case test', () {
    test('when delete all todo is called it should return null/void', () async {
      // ARRANGE
      when(mockTodoRepository.deleteAllTodo()).thenAnswer((_) async {
        return const Right(null);
      });
      // ACT
      final res = await deleteAllTodoUseCase.execute();
      // ASSERT

      expect(res, isA<void>());
    });

    test(' when delete all use case is called it should return failure', () async {
      // ARRANGE
      when(mockTodoRepository.deleteAllTodo()).thenAnswer((_) async => left(serverFailure));
      // ACT
      final res = await deleteAllTodoUseCase.execute();
      // ASSERT
      expect(res, left(serverFailure));
    });
  });
}
