import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:todo_tdd_clean/features/todo/data/datasources/todo_datasource.dart';
import 'package:todo_tdd_clean/features/todo/domain/repositories/todo_repository.dart';
import 'package:todo_tdd_clean/features/todo/domain/usecases/add_todo_usecase.dart';
import 'package:todo_tdd_clean/features/todo/domain/usecases/delete_all_todo_usecase.dart';
import 'package:todo_tdd_clean/features/todo/domain/usecases/delete_todo_usecase.dart';
import 'package:todo_tdd_clean/features/todo/domain/usecases/get_all_todo_usecase.dart';
import 'package:todo_tdd_clean/features/todo/domain/usecases/get_todo_usecase.dart';
import 'package:todo_tdd_clean/features/todo/domain/usecases/update_todo_usecase.dart';

@GenerateMocks([
  TodoRepository,
  TodoDataSource,
  AddTodoUseCase,
  GetTodoUseCase,
  GetAllTodoUseCase,
  UpdateTodoUseCase,
  DeleteTodoUseCase,
  DeleteAllTodoUseCase
], customMocks: [
  MockSpec<http.Client>(as: #MockHttpClient),
])
void main() {}
