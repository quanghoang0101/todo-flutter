import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:ToDo/presentation/home/widgets/todo_typing_widget.dart';
import 'package:ToDo/common/test/__mock__/test_mock.dart';
import 'package:ToDo/common/test/material_test_widget.dart';

void main() {
  group('ToDoTypingWidget', () {
    testWidgets('should render correcly', (WidgetTester tester) async {
      // Given
      const widget = ToDoTypingWidget();

      // When
      await tester.pumpWidget(makeTestableWidget(child: widget));

      // Then
      expect(find.byType(FlatButton), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('should not call callback function',
        (WidgetTester tester) async {
      // Given
      final mockOnSendValue = MockFunction();
      final widget = ToDoTypingWidget(
        onSendValue: (value) {
          mockOnSendValue.callback();
        },
      );

      // When
      await tester.pumpWidget(makeTestableWidget(child: widget));
      await tester.tap(find.byType(FlatButton));
      await tester.pump();

      // Then
      verifyNever(mockOnSendValue.callback());
    });

    testWidgets('should call callback function when type value',
        (WidgetTester tester) async {
      // Given
      final mockOnSendValue = MockFunction();
      final widget = ToDoTypingWidget(
        onSendValue: (value) {
          mockOnSendValue.callback();
        },
      );

      // When
      await tester.pumpWidget(makeTestableWidget(child: widget));
      await tester.enterText(find.byType(TextField), 'Hello');
      await tester.pump();
      await tester.tap(find.byType(FlatButton));
      await tester.pump();

      // Then
      verify(mockOnSendValue.callback()).called(1);
    });
  });
}
