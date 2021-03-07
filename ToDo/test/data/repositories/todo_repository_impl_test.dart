import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:ToDo/common/injector/injector.dart';
import 'package:ToDo/data/datasources/todo_datasource.dart';
import 'package:ToDo/data/models/__mock__/todo_item_model_mock.dart';
import 'package:ToDo/data/models/todo_item_model.dart';
import 'package:ToDo/data/repositories/todo_repository_impl.dart';

void main() {
  TodoRepositoryImpl _todoRepositoryImpl;
  TodoDataSource _todoDataSource;

  setUpAll(() {
    Injector.setup(isTesting: true);
    _todoDataSource = Injector.resolve<TodoDataSource>();
    _todoRepositoryImpl = TodoRepositoryImpl(_todoDataSource);
  });

  tearDownAll(() {
    Injector.container.clear();
  });

  group('TodoRepositoryImpl', () {
    test('should load all todos correctly', () {
      // Given
      when(_todoDataSource.loadTodos())
          .thenAnswer((realInvocation) => todoModelsMock);

      // When
      final todoItems = _todoRepositoryImpl.loadTodos();

      // Then
      expect(todoItems.length, equals(3));
      verify(_todoDataSource.loadTodos()).called(1);
    });

    test('should add todo correctly', () {
      // Given
      const String title = 'Title';
      final DateTime now = DateTime.now();
      final ToDoItemModel model = ToDoItemModel(title: title, date: now);
      when(_todoDataSource.addTodo(model))
          .thenAnswer((realInvocation) => todoModelsMock);

      // When
      final todoItems =
          _todoRepositoryImpl.addTodo(title: title, dateTime: now);

      // Then
      expect(todoItems.length, equals(3));
      verify(_todoDataSource.addTodo(model)).called(1);
    });

    test('should update todo correctly', () {
      // Given
      const String title = 'Title';
      final DateTime now = DateTime.now();
      const bool isCompleted = true;
      final ToDoItemModel model =
          ToDoItemModel(title: title, date: now, isCompleted: isCompleted);

      when(_todoDataSource.updateTodo(model))
          .thenAnswer((realInvocation) => todoModelsMock);

      // When
      final todoItems = _todoRepositoryImpl.updateTodo(
          title: title, dateTime: now, isCompleted: isCompleted);

      // Then
      expect(todoItems.length, equals(3));
      verify(
        _todoDataSource.updateTodo(model),
      ).called(1);
    });

    test('should remove todo correctly', () {
      // Given
      const String title = 'Title';
      final DateTime now = DateTime.now();
      const bool isCompleted = true;
      final ToDoItemModel model =
          ToDoItemModel(title: title, date: now, isCompleted: isCompleted);

      when(_todoDataSource.removeTodo(model))
          .thenAnswer((realInvocation) => todoModelsMock);

      // When
      final todoItems =
          _todoRepositoryImpl.removeTodo(title: title, dateTime: now);

      // Then
      expect(todoItems.length, equals(3));
      verify(
        _todoDataSource.removeTodo(model),
      ).called(1);
    });
  });
}
