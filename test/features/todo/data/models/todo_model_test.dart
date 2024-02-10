// MODEL DEPENDS UPON ENTITY

// TEST SCENARIOS
//  1. Model should be subclass of Entity
//  2. fromJson should return correct Model
//  3. toJson should return correct data of Model

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:todo_tdd_clean/features/todo/data/models/todo_model.dart';
import 'package:todo_tdd_clean/features/todo/domain/entities/todo_entity.dart';

import '../../../../helper/json_reader.dart';

void main() {
  setUp(() {});

  final TodoModel todoModel = TodoModel(
    id: '1',
    title: "title",
    isCompleted: false,
    createdAt: DateTime.parse('2024-02-09T23:52:30.688908'),
    updatedAt: DateTime.parse('2024-02-09T23:52:30.688908'),
  );

  group('Todo Model Test', () {
    test('Model should be subclass of Entity', () {
      //EXPECT
      // debugPrint(DateTime.now().toIso8601String());
      expect(todoModel, isA<TodoEntity>());
    });

    test('fromJson should return correct Model', () async {
      //ARRANGE
      Map<String, dynamic> js = json.decode(await jsonReader("helper/dummy_data/dummy_model.json"));
      final TodoModel todoModel0 = TodoModel.fromJson(js);
      //ACT

      //EXPECT
      expect(todoModel0, todoModel);
    });

    test('toJson should return correct data of Model', () async {
      //ARRANGE
      final Map<String, dynamic> modelJson = todoModel.toJson();
      Map<String, dynamic> js = json.decode(await jsonReader("helper/dummy_data/dummy_model.json"));

      //ACT

      //EXPECT
      expect(modelJson, js);
    });
  });
}
