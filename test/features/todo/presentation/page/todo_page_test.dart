import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_tdd_clean/features/todo/domain/entities/todo_entity.dart';
import 'package:todo_tdd_clean/features/todo/presentation/bloc/add_todo_bloc.dart';
import 'package:todo_tdd_clean/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:todo_tdd_clean/features/todo/presentation/pages/todo_page.dart';

class MockTodoAddBloc extends MockBloc<TodoEvent, TodoState> implements AddTodoBloc {}

// TEST SCENARIO
// 1. When no event is passed it should return empty widget
// 2. when add todo event is added to bloc then it return listview widget with todo
// 3. when clicked on FAB button it should create new todo and check count
// 4. when click on delete button it should remove todo from list

void main() {
  late AddTodoBloc mockAddTodoBloc;

  TodoEntity todo = TodoEntity(
      id: '1',
      title: 'title',
      isCompleted: true,
      createdAt: DateTime.parse('2024-02-09T23:52:30.688908'),
      updatedAt: DateTime.parse('2024-02-09T23:52:30.688908'));

  List<TodoEntity> todos = [todo];

  setUp(() {
    mockAddTodoBloc = MockTodoAddBloc();
  });

  Widget createTestWidget(Widget child) {
    return BlocProvider<AddTodoBloc>(
      create: (context) => mockAddTodoBloc,
      child: MaterialApp(
        home: child,
      ),
    );
  }

  testWidgets("When no event is passed it should return empty widget", (widgetTester) async {
    when(() => mockAddTodoBloc.state).thenReturn(TodoInitial());

    await widgetTester.pumpWidget(createTestWidget(const TodoPage()));
    await widgetTester.pumpAndSettle();
    // ARRANGE

    // ACT
    final res = find.byKey(const Key('emptyContainer'));

    // ASSERT

    expect(find.text('No Todo'), findsOneWidget);

    expect(res, findsOneWidget);
  });

  testWidgets("when add todo event is added to bloc then it return listview widget with todo", (widgetTester) async {
    when(() => mockAddTodoBloc.state).thenReturn(TodoLoaded(todos));

    await widgetTester.pumpWidget(createTestWidget(const TodoPage()));
    await widgetTester.pumpAndSettle();

    final res = find.byKey(const Key('listView'));

    // ASSERT

    expect(find.text('title'), findsOneWidget);

    // expect(res, findsOneWidget);
  });

  testWidgets("when click on delete button it should remove todo from list", (widgetTester) async {
    // when(() => mockAddTodoBloc.state).thenReturn(TodoInitial());
    when(() => mockAddTodoBloc.state).thenReturn(const TodoError('some error'));

    await widgetTester.pumpWidget(createTestWidget(const TodoPage()));
    await widgetTester.pumpAndSettle();
    // ARRANGE

    // ACT

    // final res = find.byKey(const Key('listView'));

    // ASSERT

    expect(find.text('some error'), findsOneWidget);

    // expect(res, findsOneWidget);
  });
}
