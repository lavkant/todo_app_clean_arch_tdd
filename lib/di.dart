import 'package:get_it/get_it.dart';
import 'package:todo_tdd_clean/features/todo/data/datasources/todo_datasource.dart';
import 'package:todo_tdd_clean/features/todo/data/repositories/todo_repository.dart';
import 'package:todo_tdd_clean/features/todo/domain/repositories/todo_repository.dart';
import 'package:todo_tdd_clean/features/todo/domain/usecases/add_todo_usecase.dart';
import 'package:todo_tdd_clean/features/todo/domain/usecases/delete_all_todo_usecase.dart';
import 'package:todo_tdd_clean/features/todo/domain/usecases/delete_todo_usecase.dart';
import 'package:todo_tdd_clean/features/todo/domain/usecases/get_all_todo_usecase.dart';
import 'package:todo_tdd_clean/features/todo/domain/usecases/get_todo_usecase.dart';
import 'package:todo_tdd_clean/features/todo/domain/usecases/update_todo_usecase.dart';
import 'package:todo_tdd_clean/features/todo/presentation/bloc/add_todo_bloc.dart';

final getIt = GetIt.instance;

setUpLocator() {
  // REGISTER BLOC
  getIt.registerFactory(() => AddTodoBloc(
      addTodoUseCase: getIt(),
      getTodoUseCase: getIt(),
      getAllTodoUseCase: getIt(),
      updateTodoUseCase: getIt(),
      deleteTodoUseCase: getIt(),
      deleteAllTodoUseCase: getIt()));

  // REGISTER USECASE
  getIt.registerLazySingleton(() => AddTodoUseCase(getIt()));
  getIt.registerLazySingleton(() => GetAllTodoUseCase(getIt()));
  getIt.registerLazySingleton(() => GetTodoUseCase(getIt()));
  getIt.registerLazySingleton(() => UpdateTodoUseCase(getIt()));
  getIt.registerLazySingleton(() => DeleteTodoUseCase(getIt()));
  getIt.registerLazySingleton(() => DeleteAllTodoUseCase(getIt()));

  // REGISTER REPOSITORY
  getIt.registerLazySingleton<TodoRepository>(() => TodoRepositoryImpl(getIt()));

  // REGISTER DATASOURCE
  getIt.registerLazySingleton<TodoDataSource>(() => TodoDataSourceImpl());
}
