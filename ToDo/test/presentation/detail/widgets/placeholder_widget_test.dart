import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ToDo/common/test/material_test_widget.dart';
import 'package:ToDo/presentation/detail/widgets/placeholder_widget.dart';

void main() {
  group('PlaceHolderWidget', () {
    testWidgets('should render correctly', (WidgetTester tester) async {
      // Given
      final widget = PlaceHolderWidget();

      // When
      await tester.pumpWidget(makeTestableWidget(child: widget));

      // Then
      expect(find.byType(Image), findsOneWidget);
      expect(find.byType(Text), findsNWidgets(2));
    });
  });
}
