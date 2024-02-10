import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_tdd_clean/features/todo/domain/entities/todo_entity.dart';
import 'package:todo_tdd_clean/features/todo/presentation/bloc/add_todo_bloc.dart';
import 'package:todo_tdd_clean/features/todo/presentation/bloc/todo_bloc.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // context.read<AddTodoBloc>().add(GetAllTodoEvent());
  }

  TextEditingController titleController = TextEditingController();

  // OPEN AlertDialog
  Future<void> _showMyDialog(BuildContext context) async {
    titleController.clear();
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Todo'),
          content: TextFormField(
            key: const Key("titleField"),
            controller: titleController,
            decoration: const InputDecoration(
              labelText: 'Title',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              // context.read<AddTodoBloc>().add(AddTodoEvent(TodoEntity(
              //     id: '1',
              //     title: value,
              //     isCompleted: true,
              //     createdAt: DateTime.now(),
              //     updatedAt: DateTime.parse('2024-02-09T23:52:30.688908'))));
            },
            onSaved: (v) {},
          ),
          actions: <Widget>[
            TextButton(
              key: const Key("yesButton"),
              child: const Text('Yes'),
              onPressed: () {
                final TodoEntity todo = TodoEntity(
                    id: Random.secure().toString(),
                    title: titleController.text,
                    isCompleted: false,
                    createdAt: DateTime.now(),
                    updatedAt: DateTime.now());
                context.read<AddTodoBloc>().add(AddTodoEvent(todo));
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              key: const Key("noButton"),
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showEditDialog(BuildContext context, TodoEntity todo) async {
    titleController.clear();
    titleController.text = todo.title;
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Todo'),
          content: TextFormField(
            key: const Key("editTextField"),
            controller: titleController,
            decoration: const InputDecoration(
              labelText: 'Title',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              // context.read<AddTodoBloc>().add(AddTodoEvent(TodoEntity(
              //     id: '1',
              //     title: value,
              //     isCompleted: true,
              //     createdAt: DateTime.now(),
              //     updatedAt: DateTime.parse('2024-02-09T23:52:30.688908'))));
            },
            onSaved: (v) {},
          ),
          actions: <Widget>[
            TextButton(
              key: const Key("yesButton"),
              child: const Text('Yes'),
              onPressed: () {
                final TodoEntity todo0 = TodoEntity(
                  id: todo.id,
                  title: titleController.text,
                  isCompleted: todo.isCompleted,
                  createdAt: todo.createdAt,
                  updatedAt: DateTime.now(),
                );
                context.read<AddTodoBloc>().add(UpdateTodoEvent(todo0));
                context.read<AddTodoBloc>().add(GetAllTodoEvent());

                titleController.clear();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              key: const Key("noButton"),
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Todo'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showMyDialog(context);
            // context.read<AddTodoBloc>().add(AddTodoEvent(TodoEntity(
            //     id: '1',
            //     title: 'title',
            //     isCompleted: true,
            //     createdAt: DateTime.now(),
            //     updatedAt: DateTime.parse('2024-02-09T23:52:30.688908'))));
          },
          tooltip: 'Add Todo',
          child: const Icon(Icons.add),
        ),
        body: BlocBuilder<AddTodoBloc, TodoState>(builder: (context, state) {
          if (state is TodoInitial) {
            return const Center(
              key: Key('emptyContainer'),
              child: Text("No Todo"),
            );
          } else if (state is TodoLoaded) {
            return ListView.builder(
              key: const Key("listView"),
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                    onTap: () {
                      _showEditDialog(context, state.todos[index]);
                    },
                    title: Text(state.todos[index].title),
                    // DATE FORMAT JM
                    subtitle: Text(DateFormat.jm().format(state.todos[index].updatedAt)),
                    // subtitle: Text(),
                    trailing: IconButton(
                      key: const Key("deleteButton"),
                        onPressed: () {
                          context.read<AddTodoBloc>().add(DeleteTodoEvent(state.todos[index]));
                          context.read<AddTodoBloc>().add(GetAllTodoEvent());
                        },
                        icon: const Icon(Icons.delete)));
              },
            );
          } else if (state is TodoError) {
            return Center(
              child: Text(state.message),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }));
  }
}
