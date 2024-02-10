import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_tdd_clean/core/failures/failures.dart';
import 'package:todo_tdd_clean/features/todo/domain/entities/todo_entity.dart';
import 'package:todo_tdd_clean/features/todo/domain/usecases/add_todo_usecase.dart';
import 'package:todo_tdd_clean/features/todo/presentation/bloc/add_todo_bloc.dart';
import 'package:todo_tdd_clean/features/todo/presentation/bloc/todo_bloc.dart';

import '../../../../helper/test_helper.mocks.dart';

// TEST SCENARIO
// 1. When no event passed to the bloc, then the initial state should be TodoInitial
// 2. When add todo event passed to the bloc, then the state should be TodoLoading and TodoLoaded
// 3. when add todo event is passed to bloc, return TodoError State

void main() {
  late AddTodoBloc bloc;
  late AddTodoUseCase addTodoUseCase;

  setUp(() {
    addTodoUseCase = MockAddTodoUseCase();
    bloc = AddTodoBloc(addTodoUseCase: addTodoUseCase);
  });

  TodoEntity todo = TodoEntity(
    id: '1',
    title: "title",
    isCompleted: true,
    createdAt: DateTime.parse('2024-02-09T23:52:30.688908'),
    updatedAt: DateTime.parse('2024-02-09T23:52:30.688908'),
  );

  List<TodoEntity> todos = [todo];

  const ServerFailure serverFailure = ServerFailure(errorMessage: 'error');
  group('add todo bloc test case', () {
    test('When no event passed to the bloc, then the initial state should be TodoInitial', () {
      //ARRANGE

      // ACT

      // ASSERT
      expect(bloc.state, TodoInitial());
    });

    blocTest<AddTodoBloc, TodoState>(
      'When add todo event passed to the bloc, then the state should be TodoLoading and TodoLoaded',
      build: () {
        when(addTodoUseCase.execute(todo)).thenAnswer((_) async => Right(todos));
        return bloc;
      },
      act: (bloc) => bloc.add(AddTodoEvent(todo)),
      expect: () => <TodoState>[
        TodoLoading(),
        TodoLoaded(todos),
      ],
    );

    blocTest<AddTodoBloc, TodoState>(
      'when add todo event is passed to bloc, return TodoError State',
      build: () {
        when(addTodoUseCase.execute(todo)).thenAnswer((_) async => const Left(serverFailure));
        return bloc;
      },
      act: (bloc) => bloc.add(AddTodoEvent(todo)),
      expect: () => <TodoState>[
        TodoLoading(),
        const TodoError('error'),
      ],
    );
  });
}
