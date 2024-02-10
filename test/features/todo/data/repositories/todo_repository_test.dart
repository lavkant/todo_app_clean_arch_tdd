import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_tdd_clean/features/todo/data/datasources/todo_datasource.dart';
import 'package:todo_tdd_clean/features/todo/data/models/todo_model.dart';
import 'package:todo_tdd_clean/features/todo/data/repositories/todo_repository.dart';
import 'package:todo_tdd_clean/features/todo/domain/repositories/todo_repository.dart';

import '../../../../helper/test_helper.mocks.dart';

// TEST SCENARIOS DATA SOURCE
// 1. When addTodo is called it should return list of TodoModel
// 2. When deleteAllTodo is called it should return void
// 3. When deleteTodo is called it should return TodoModel
// 4. When getAllTodo is called it should return list of TodoModel
// 5. When getTodo is called it should return TodoModel
// 6. When updateTodo is called it should return TodoModel

void main() {
  late TodoDataSource dataSource;

  late TodoRepository mockTodoRepository;

  List<TodoModel> todos = [
    TodoModel(
      id: '1',
      title: "title",
      isCompleted: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    )
  ];

  final todoModel = TodoModel(
    id: '1',
    title: "title",
    isCompleted: true,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  setUp(() {
    dataSource = MockTodoDataSource();
    mockTodoRepository = TodoRepositoryImpl(dataSource);
  });

  group('data source test', () {
    test('addTodo should return list of TodoModel', () async {
      //ARRANGE
      when(dataSource.addTodo(todoModel)).thenAnswer((_) async => todos);

      //ACT
      final res = await mockTodoRepository.addTodo(todoModel);
      //EXPECT
      expect(res, Right(todos));
    });

    test('deleteAllTodo should return void', () async {
      //ARRANGE
      when(dataSource.deleteAllTodo()).thenAnswer((_) async {});
      //ACT
      final res = await mockTodoRepository.deleteAllTodo();

      //EXPECT
      expect(res, const Right(null));
    });

    test('deleteTodo should return TodoModel', () async {
      when(dataSource.deleteTodo(todoModel)).thenAnswer((_) async => todoModel);
      //ARRANGE

      final res = await mockTodoRepository.deleteTodo(todoModel);
      //ACT
      //EXPECT
      expect(res, Right(todoModel));
    });

    test('getAllTodo should return list of TodoModel', () async {
      when(dataSource.getAllTodo()).thenAnswer((_) async => todos);
      //ARRANGE
      //ACT
      final res = await mockTodoRepository.getAllTodo();
      //EXPECT
      expect(res, Right(todos));
    });

    test('getTodo should return TodoModel', () async {
      when(dataSource.getTodo('1')).thenAnswer((_) async => todoModel);
      //ARRANGE

      final res = await mockTodoRepository.getTodo('1');
      //ACT
      //EXPECT
      expect(res, Right(todoModel));
    });

    test('updateTodo should return TodoModel', () async {
      when(dataSource.updateTodo(todoModel)).thenAnswer((_) async => todoModel);
      //ARRANGE
      final res = await mockTodoRepository.updateTodo(todoModel);
      //ACT
      //EXPECT
      expect(res, Right(todoModel));
    });
  });
}
