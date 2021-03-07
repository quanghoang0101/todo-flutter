import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:ToDo/common/test/__mock__/test_mock.dart';
import 'package:ToDo/common/test/material_test_widget.dart';
import 'package:ToDo/presentation/detail/widgets/todo_item_widget.dart';

void main() {
  group('ToDoItemWidget', () {
    testWidgets('should render correctly', (WidgetTester tester) async {
      // Given
      const widget = ToDoItemWidget(
        title: 'Title',
        subtitle: 'Subtitle',
        isSelected: true,
      );

      // When
      await tester.pumpWidget(makeTestableWidget(child: widget));

      // Then
      expect(find.byType(Text), findsNWidgets(2));
      expect(find.byType(Checkbox), findsOneWidget);
    });

    testWidgets('verify callback action correctly',
        (WidgetTester tester) async {
      // Given
      final mockFunction = MockFunction();
      final widget = ToDoItemWidget(
        title: 'Title',
        subtitle: 'Subtitle',
        isSelected: true,
        onSelectChanged: (value) => mockFunction.callback(),
      );

      // When
      await tester.pumpWidget(makeTestableWidget(child: widget));
      await tester.tap(find.byType(Checkbox));
      await tester.pump();

      // Then
      verify(mockFunction.callback()).called(1);
    });
  });
}
