import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_tdd_clean/features/todo/data/models/todo_model.dart';
import 'package:todo_tdd_clean/features/todo/domain/entities/todo_entity.dart';
import 'package:todo_tdd_clean/features/todo/domain/usecases/add_todo_usecase.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final AddTodoUseCase useCase;

  TodoBloc(this.useCase) : super(TodoInitial()) {
    on<TodoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
