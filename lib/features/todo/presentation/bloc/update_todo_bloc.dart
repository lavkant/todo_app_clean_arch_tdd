import 'package:bloc/bloc.dart';
import 'package:todo_tdd_clean/features/todo/domain/usecases/update_todo_usecase.dart';
import 'package:todo_tdd_clean/features/todo/presentation/bloc/todo_bloc.dart';

class UpdateTodoBloc extends Bloc<TodoEvent, TodoState> {
  final UpdateTodoUseCase useCase;

  UpdateTodoBloc(this.useCase) : super(TodoInitial()) {
    on<TodoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
