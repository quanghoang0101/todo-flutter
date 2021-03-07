import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:ToDo/common/injector/injector.dart';
import 'package:ToDo/data/models/__mock__/todo_item_model_mock.dart';
import 'package:ToDo/data/repositories/todo_repository_impl.dart';
import 'package:ToDo/domain/usecases/todo_usecase.dart';

void main() {
  TodoRepositoryImpl _todoRepositoryImpl;
  TodoUseCase _todoUseCase;

  setUpAll(() {
    Injector.setup(isTesting: true);
    _todoRepositoryImpl = Injector.resolve<TodoRepositoryImpl>();
    _todoUseCase = TodoUseCase(_todoRepositoryImpl);
  });

  tearDownAll(() {
    Injector.container.clear();
  });

  group('TodoUseCase', () {
    test('should load all todos correctly', () {
      // Given
      when(_todoRepositoryImpl.loadTodos())
          .thenAnswer((realInvocation) => todoModelsMock);

      // When
      final todoItems = _todoUseCase.loadTodos();

      // Then
      expect(todoItems.length, equals(3));
      verify(_todoRepositoryImpl.loadTodos()).called(1);
    });

    test('should add todo correctly', () {
      // Given
      const String title = 'Title';
      final DateTime now = DateTime.now();
      when(_todoRepositoryImpl.addTodo(title: title, dateTime: now))
          .thenAnswer((realInvocation) => todoModelsMock);

      // When
      final todoItems = _todoUseCase.addTodo(title: title, dateTime: now);

      // Then
      expect(todoItems.length, equals(3));
      verify(_todoRepositoryImpl.addTodo(title: title, dateTime: now))
          .called(1);
    });

    test('should update todo correctly', () {
      // Given
      const String title = 'Title';
      final DateTime now = DateTime.now();
      const bool isCompleted = true;

      when(_todoRepositoryImpl.updateTodo(
              title: title, dateTime: now, isCompleted: isCompleted))
          .thenAnswer((realInvocation) => todoModelsMock);

      // When
      final todoItems = _todoUseCase.updateTodo(
          title: title, dateTime: now, isCompleted: isCompleted);

      // Then
      expect(todoItems.length, equals(3));
      verify(
        _todoRepositoryImpl.updateTodo(
            title: title, dateTime: now, isCompleted: isCompleted),
      ).called(1);
    });
  });
}
