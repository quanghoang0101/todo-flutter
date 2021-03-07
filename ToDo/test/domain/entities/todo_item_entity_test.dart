import 'package:flutter_test/flutter_test.dart';

import 'package:ToDo/domain/entities/todo_item_entity.dart';

void main() {
  group('ToDoItemEntity', () {
    test('should compare correctly', () {
      // Given
      const String title = 'Title';
      final DateTime dateTime = DateTime.now();

      // When
      final firstEntity = ToDoItemEntity(title: title, date: dateTime);
      final secondEntity = ToDoItemEntity(title: title, date: dateTime);

      // Then
      expect(firstEntity, equals(secondEntity));
    });
  });
}
