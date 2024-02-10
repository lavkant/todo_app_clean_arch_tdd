part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class AddTodoEvent extends TodoEvent {
  final TodoEntity todo;

  const AddTodoEvent(this.todo);

  @override
  List<Object> get props => [todo];
}

class GetTodoEvent extends TodoEvent {
  final String id;

  const GetTodoEvent(this.id);

  @override
  List<Object> get props => [id];
}

class GetAllTodoEvent extends TodoEvent {}

class DeleteTodoEvent extends TodoEvent {
  final TodoEntity todo;

  const DeleteTodoEvent(this.todo);

  @override
  List<Object> get props => [todo];
}

class DeleteAllTodoEvent extends TodoEvent {}

class UpdateTodoEvent extends TodoEvent {
  final TodoEntity todo;

  const UpdateTodoEvent(this.todo);

  @override
  List<Object> get props => [todo];
}
