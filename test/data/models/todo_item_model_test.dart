import 'package:flutter_test/flutter_test.dart';

import 'package:ToDo/data/models/todo_item_model.dart';

void main() {
  group('ToDoItemModel', () {
    test('should init model correctly', () {
      // Given
      const String title = 'Title';
      final DateTime now = DateTime.now();

      // When
      final model = ToDoItemModel(title: title, date: now);

      // Then
      expect(model.title, equals(title));
      expect(model.date, equals(now));
      expect(model.isCompleted, equals(false));
    });
  });
}
