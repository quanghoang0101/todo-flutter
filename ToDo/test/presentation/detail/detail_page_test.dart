import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:ToDo/common/constants/page_type_enum.dart';
import 'package:ToDo/common/injector/injector.dart';
import 'package:ToDo/common/test/material_test_widget.dart';
import 'package:ToDo/domain/entities/__mock__/todo_item_entity_mock.dart';
import 'package:ToDo/presentation/detail/bloc/todo_bloc.dart';
import 'package:ToDo/presentation/detail/detail_page.dart';
import 'package:ToDo/presentation/detail/widgets/placeholder_widget.dart';
import 'package:ToDo/presentation/home/bloc/home_bloc.dart';

void main() {
  TodoBloc _todoBloc;
  HomeBloc _homeBloc;

  setUpAll(() {
    Injector.setup(isTesting: true);
    _todoBloc = Injector.resolve<TodoBloc>();
    _homeBloc = Injector.resolve<HomeBloc>();
  });

  tearDownAll(() {
    _todoBloc.close();
    _homeBloc.close();
    Injector.container.clear();
  });

  group('DetailPage', () {
    testWidgets('should render empty state correctly',
        (WidgetTester tester) async {
      // Given
      const pageType = ToDoPageType.completed;
      const widget = DetailPage(pageType: pageType);
      final wrapper = wrapProvider(_homeBloc, widget);
      when(_todoBloc.state).thenAnswer((realInvocation) => TodoInitial());
      when(_homeBloc.state).thenAnswer((realInvocation) => HomeInitial());

      // When
      await tester.pumpWidget(makeTestableWidget(child: wrapper));

      // Then
      expect(find.byType(PlaceHolderWidget), findsOneWidget);
      expect(find.byType(ListView), findsNothing);
    });

    testWidgets('should render has todos state correctly',
        (WidgetTester tester) async {
      // Given
      const pageType = ToDoPageType.completed;
      const widget = DetailPage(pageType: pageType);
      final wrapper = wrapProvider(_homeBloc, widget);
      when(_todoBloc.state)
          .thenAnswer((realInvocation) => TodoLoaded(items: todoEntitiesMock));
      when(_homeBloc.state).thenAnswer((realInvocation) => HomeInitial());

      // When
      await tester.pumpWidget(makeTestableWidget(child: wrapper));

      // Then
      expect(find.byType(PlaceHolderWidget), findsNothing);
      expect(find.byType(ListView), findsOneWidget);
    });

    testWidgets('verify reload todos correctly', (WidgetTester tester) async {
      // Given
      const pageType = ToDoPageType.incomplete;
      const widget = DetailPage(pageType: pageType);
      final wrapper = wrapProvider(_homeBloc, widget);
      when(_todoBloc.state)
          .thenAnswer((realInvocation) => TodoLoaded(items: todoEntitiesMock));
      whenListen(
        _homeBloc,
        Stream<HomeState>.fromIterable(
          [
            HomeInitial(),
            HomeAddedTodo(todoEntitiesMock),
          ],
        ),
      );

      //When
      await tester.pumpWidget(makeTestableWidget(child: wrapper));

      // Then
      verify(_todoBloc.add(TodoLoadedEvent(pageType))).called(2);
    });

    testWidgets('verify select todo updated', (WidgetTester tester) async {
      // Given
      const widget = DetailPage(pageType: ToDoPageType.completed);
      final wrapper = wrapProvider(_homeBloc, widget);
      when(_todoBloc.state).thenAnswer(
          (realInvocation) => TodoLoaded(items: [toDoItemEntityMock]));
      when(_homeBloc.state).thenAnswer((realInvocation) => HomeInitial());

      //When
      await tester.pumpWidget(makeTestableWidget(child: wrapper));
      await tester.tap(find.byType(Checkbox));
      await tester.pump();

      // Then
      verify(
        _todoBloc.add(
          TodoUpdateEvent(
              pageType: ToDoPageType.completed,
              entity: toDoItemEntityMock,
              isSelected: false),
        ),
      ).called(1);
    });
  });
}
