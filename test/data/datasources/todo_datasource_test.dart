import 'package:flutter_test/flutter_test.dart';

import 'package:ToDo/data/datasources/todo_datasource.dart';
import 'package:ToDo/data/models/__mock__/todo_item_model_mock.dart';

void main() {
  group('TodoDataSource', () {
    test('should init data correctly', () {
      // Given
      final dataSource = TodoDataSource();

      // Then
      expect(dataSource.todos.length, equals(0));
    });

    test('should load data correctly', () {
      // Given
      final dataSource = TodoDataSource();
      dataSource.addTodo(todoModelMock);

      // When
      final items = dataSource.loadTodos();

      // Then
      expect(items.length, equals(1));
    });

    test('should remove data correctly', () {
      // Given
      final dataSource = TodoDataSource();
      dataSource.addTodo(todoModelMock);

      // When
      final items = dataSource.removeTodo(todoModelMock);

      // Then
      expect(items.length, equals(0));
    });

    test('should update data correctly', () {
      // Given
      final dataSource = TodoDataSource();
      dataSource.addTodo(todoModelMock);

      // When
      final items = dataSource.updateTodo(todoModelMock);

      // Then
      expect(items.length, equals(1));
    });
  });
}
