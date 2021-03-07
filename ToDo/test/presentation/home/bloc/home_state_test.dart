import 'package:flutter_test/flutter_test.dart';

import 'package:ToDo/domain/entities/__mock__/todo_item_entity_mock.dart';
import 'package:ToDo/presentation/home/bloc/home_bloc.dart';

void main() {
  group('HomeState', () {
    test('should compare correctly', () {
      // Given
      final todoEntities = todoEntitiesMock;

      // When
      final firstState = HomeAddedTodo(todoEntities);
      final secondState = HomeAddedTodo(todoEntities);

      // Then
      expect(firstState, equals(secondState));
    });
  });
}
