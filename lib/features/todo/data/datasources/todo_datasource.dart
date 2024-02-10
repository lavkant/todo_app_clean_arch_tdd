import 'package:todo_tdd_clean/features/todo/data/models/todo_model.dart';

class TodoDataSourceImpl implements TodoDataSource {
  List<TodoModel> todoList = [];

  @override
  Future<List<TodoModel>> addTodo(TodoModel todo) {
    try {
      todoList.add(todo);
      return Future.value(todoList);
    } on Exception {
      throw Exception();
    }
  }

  @override
  Future<void> deleteAllTodo() {
    try {
      todoList.clear();
      return Future.value(null);
    } on Exception {
      throw Exception();
    }
  }

  @override
  Future<TodoModel> deleteTodo(TodoModel todo) {
    try {
      todoList.remove(todo);
      return Future.value(todo);
    } on Exception {
      throw Exception();
    }
  }

  @override
  Future<List<TodoModel>> getAllTodo() {
    try {
      return Future.value(todoList);
    } on Exception {
      throw Exception();
    }
  }

  @override
  Future<TodoModel> getTodo(String id) {
    try {
      return Future.value(todoList.firstWhere((element) => element.id == id));
    } on Exception {
      throw Exception();
    }
  }

  @override
  Future<TodoModel> updateTodo(TodoModel todo) {
    try {
      todoList.removeWhere((element) => element.id == todo.id);
      todoList.add(todo);
      return Future.value(todo);
    } on Exception {
      throw Exception();
    }
  }
}

abstract class TodoDataSource {
  Future<List<TodoModel>> addTodo(TodoModel todo);
  Future<TodoModel> deleteTodo(TodoModel todo);
  Future<TodoModel> updateTodo(TodoModel todo);
  Future<TodoModel> getTodo(String id);
  Future<List<TodoModel>> getAllTodo();
  Future<void> deleteAllTodo();
}
