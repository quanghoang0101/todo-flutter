import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:ToDo/common/injector/injector.dart';
import 'package:ToDo/common/test/material_test_widget.dart';
import 'package:ToDo/presentation/home/home_page.dart';
import 'package:ToDo/presentation/detail/bloc/todo_bloc.dart';
import 'package:ToDo/presentation/home/bloc/home_bloc.dart';
import 'package:ToDo/presentation/home/widgets/todo_typing_widget.dart';

void main() {
  HomeBloc _todoHomeBloc;
  TodoBloc _todoBloc;

  setUpAll(() {
    Injector.setup(isTesting: true);
    _todoHomeBloc = Injector.resolve<HomeBloc>();
    _todoBloc = Injector.resolve<TodoBloc>();
  });

  tearDownAll(() {
    _todoHomeBloc.close();
    _todoBloc.close();
    Injector.container.clear();
  });

  group('HomePage', () {
    testWidgets('should render correctly', (WidgetTester tester) async {
      // Given
      final widget = HomePage();
      when(_todoHomeBloc.state).thenAnswer((realInvocation) => HomeInitial());
      when(_todoBloc.state).thenAnswer((realInvocation) => TodoInitial());

      // When
      await tester.pumpWidget(makeTestableWidget(child: widget));

      // Then
      expect(find.byType(TabBar), findsOneWidget);
      expect(find.byType(TabBarView), findsOneWidget);
      expect(find.byType(ToDoTypingWidget), findsOneWidget);
    });

    testWidgets('should send the adding action correcly',
        (WidgetTester tester) async {
      // Given
      final widget = HomePage();
      when(_todoHomeBloc.state).thenAnswer((realInvocation) => HomeInitial());
      when(_todoBloc.state).thenAnswer((realInvocation) => TodoInitial());

      // When
      await tester.pumpWidget(makeTestableWidget(child: widget));
      await tester.enterText(find.byType(TextField), 'Hello');
      await tester.pump();
      await tester.tap(find.byType(FlatButton));
      await tester.pump();

      // Then
      verify(_todoHomeBloc.add(HomeAddTodoEvent('Hello'))).called(1);
    });
  });
}
