import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_tdd_clean/app.dart';
import 'package:todo_tdd_clean/di.dart';
import 'package:todo_tdd_clean/features/todo/presentation/bloc/add_todo_bloc.dart';

void main() {
  setUpLocator();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => getIt<AddTodoBloc>(),
      ),
      // BlocProvider(
      //   create: (context) => SubjectBloc(),
      // ),
    ],
    child: const MyApp(),
  ));
}
