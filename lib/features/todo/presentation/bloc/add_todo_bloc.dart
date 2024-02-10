import 'package:bloc/bloc.dart';
import 'package:todo_tdd_clean/features/todo/domain/usecases/add_todo_usecase.dart';
import 'package:todo_tdd_clean/features/todo/domain/usecases/delete_all_todo_usecase.dart';
import 'package:todo_tdd_clean/features/todo/domain/usecases/delete_todo_usecase.dart';
import 'package:todo_tdd_clean/features/todo/domain/usecases/get_all_todo_usecase.dart';
import 'package:todo_tdd_clean/features/todo/domain/usecases/get_todo_usecase.dart';
import 'package:todo_tdd_clean/features/todo/domain/usecases/update_todo_usecase.dart';
import 'package:todo_tdd_clean/features/todo/presentation/bloc/todo_bloc.dart';

class AddTodoBloc extends Bloc<TodoEvent, TodoState> {
  final AddTodoUseCase? addTodoUseCase;
  final GetTodoUseCase? getTodoUseCase;
  final GetAllTodoUseCase? getAllTodoUseCase;
  final UpdateTodoUseCase? updateTodoUseCase;
  final DeleteTodoUseCase? deleteTodoUseCase;
  final DeleteAllTodoUseCase? deleteAllTodoUseCase;

  AddTodoBloc({
    this.getTodoUseCase,
    this.getAllTodoUseCase,
    this.updateTodoUseCase,
    this.deleteTodoUseCase,
    this.deleteAllTodoUseCase,
    this.addTodoUseCase,
  }) : super(TodoInitial()) {
    on<AddTodoEvent>((event, emit) {
      emit(TodoLoading());
      addTodoUseCase?.execute(event.todo).then((result) {
        result.fold(
          (failure) => emit(TodoError(failure.errorMessage)),
          (todos) => emit(TodoLoaded(todos)),
        );
      });
    });

    on<DeleteTodoEvent>((event, emit) {
      // emit(TodoLoading());
      deleteTodoUseCase?.execute(event.todo).then((result) {
        result.fold(
          (failure) => emit(TodoError(failure.errorMessage)),
          (todos) {
            // emit(TodoLoaded(todos));
          },
        );
      });
    });

    on<GetAllTodoEvent>((event, emit) {
      emit(TodoLoading());
      getAllTodoUseCase?.execute().then((result) {
        result.fold(
          (failure) => emit(TodoError(failure.errorMessage)),
          (todos) => emit(TodoLoaded(todos)),
        );
      });
    });

    on<UpdateTodoEvent>((event, emit) {
      updateTodoUseCase?.execute(event.todo).then((result) {
        result.fold(
          (failure) => emit(TodoError(failure.errorMessage)),
          (todos) {},
        );
      });
    });
  }
}
