import 'package:flutter_test/flutter_test.dart';

import 'package:ToDo/domain/entities/__mock__/todo_item_entity_mock.dart';
import 'package:ToDo/presentation/detail/bloc/todo_bloc.dart';

void main() {
  group('TodoState', () {
    test('should compare correctly', () {
      // Given
      final mock = todoEntitiesMock;

      // When
      final firstState = TodoLoaded(items: mock);
      final secondState = TodoLoaded(items: mock);

      // Then
      expect(firstState, equals(secondState));
    });
  });
}
