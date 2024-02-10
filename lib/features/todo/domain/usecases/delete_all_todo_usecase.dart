import 'package:dartz/dartz.dart';
import 'package:todo_tdd_clean/core/failures/failures.dart';
import 'package:todo_tdd_clean/features/todo/domain/repositories/todo_repository.dart';

class DeleteAllTodoUseCase {
  final TodoRepository todoRepository;
  DeleteAllTodoUseCase(this.todoRepository);

  Future<Either<Failure, void>> execute() async {
    return await todoRepository.deleteAllTodo();
  }
}
