import 'package:dartz/dartz.dart';
import 'package:todo_tdd_clean/core/failures/failures.dart';
import 'package:todo_tdd_clean/features/todo/domain/entities/todo_entity.dart';
import 'package:todo_tdd_clean/features/todo/domain/repositories/todo_repository.dart';

class GetTodoUseCase {
  final TodoRepository todoRepository;
  GetTodoUseCase(this.todoRepository);

  Future<Either<Failure, TodoEntity>> execute(String id) async {
    return await todoRepository.getTodo(id);
  }
}
