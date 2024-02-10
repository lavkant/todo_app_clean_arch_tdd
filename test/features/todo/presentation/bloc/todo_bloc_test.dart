import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_tdd_clean/features/todo/domain/usecases/add_todo_usecase.dart';
import 'package:todo_tdd_clean/features/todo/domain/usecases/delete_all_todo_usecase.dart';
import 'package:todo_tdd_clean/features/todo/domain/usecases/delete_todo_usecase.dart';
import 'package:todo_tdd_clean/features/todo/domain/usecases/get_all_todo_usecase.dart';
import 'package:todo_tdd_clean/features/todo/domain/usecases/get_todo_usecase.dart';
import 'package:todo_tdd_clean/features/todo/domain/usecases/update_todo_usecase.dart';
import 'package:todo_tdd_clean/features/todo/presentation/bloc/todo_bloc.dart';

class MockTodoBloc extends MockBloc<TodoEvent, TodoState> implements TodoBloc {}

// TEST SCENARIO
// 1. When no event passed to the bloc, then the initial state should be TodoInitial
// 2. When add todo event passed to the bloc, then the state should be TodoLoading and TodoLoaded
// 3. when update todo event passed to bloc, then the state should be TodoLoading and TodoLoaded
// 4. when delete todo event passed to bloc, then the state should be TodoLoading and TodoLoaded
// 5. when get all todo event passed to bloc, then the state should be TodoLoading and TodoLoaded
// 6. when get todo event passed to bloc, then the state should be TodoLoading and TodoLoaded
// 7. when delete all todo event passed to bloc, then the state should be TodoLoading and TodoLoaded

void main() {
  late MockTodoBloc todoBloc;

  late AddTodoUseCase addTodoUseCase;
  late GetAllTodoUseCase getAllTodoUseCase;
  late GetTodoUseCase getTodoUseCase;
  late UpdateTodoUseCase updateTodoUseCase;
  late DeleteAllTodoUseCase deleteAllTodoUseCase;
  late DeleteTodoUseCase deleteTodoUseCase;

  setUp(() {
    todoBloc = MockTodoBloc();
   
  });
}
