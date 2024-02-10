import 'package:dartz/dartz.dart';
import 'package:todo_tdd_clean/core/failures/failures.dart';
import 'package:todo_tdd_clean/features/todo/domain/entities/todo_entity.dart';
import 'package:todo_tdd_clean/features/todo/domain/repositories/todo_repository.dart';

class GetAllTodoUseCase {
  final TodoRepository todoRepository;
  GetAllTodoUseCase(this.todoRepository);

  Future<Either<Failure, List<TodoEntity>>> execute() async {
    return await todoRepository.getAllTodo();
  }
}
