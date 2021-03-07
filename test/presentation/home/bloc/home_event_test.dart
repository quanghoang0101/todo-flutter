import 'package:ToDo/presentation/home/bloc/home_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeEvent', () {
    test('should compare correctly', () {
      // Given
      const String title = 'Title';

      // When
      final firstEvent = HomeAddTodoEvent(title);
      final sencondEvent = HomeAddTodoEvent(title);

      // Then
      expect(firstEvent, equals(sencondEvent));
    });
  });
}
