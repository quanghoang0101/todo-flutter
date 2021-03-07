import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:ToDo/common/constants/page_type_enum.dart';
import 'package:ToDo/common/injector/injector.dart';
import 'package:ToDo/domain/entities/__mock__/todo_item_entity_mock.dart';
import 'package:ToDo/domain/usecases/todo_usecase.dart';
import 'package:ToDo/presentation/detail/bloc/todo_bloc.dart';

void main() {
  TodoUseCase _todoUseCase;

  setUpAll(() {
    Injector.setup(isTesting: true);
    _todoUseCase = Injector.resolve<TodoUseCase>();
  });

  tearDownAll(() {
    Injector.container.clear();
  });

  group('TodoBloc Update Event To State', () {
    blocTest<TodoBloc, TodoState>(
      'emits [TodoLoading, TodoAdded] when todo is updated with page all',
      build: () {
        when(_todoUseCase.updateTodo(
                title: toDoItemEntityMock.title,
                dateTime: toDoItemEntityMock.date,
                isCompleted: true))
            .thenAnswer((realInvocation) => todoEntitiesMock);
        return TodoBloc(_todoUseCase);
      },
      act: (bloc) => bloc.add(
        TodoUpdateEvent(
            pageType: ToDoPageType.all,
            entity: toDoItemEntityMock,
            isSelected: true),
      ),
      expect: [isA<TodoLoading>(), isA<TodoAdded>()],
    );

    blocTest<TodoBloc, TodoState>(
      'emits [TodoLoading, TodoAdded] '
      'when todo is updated with page incomplete',
      build: () {
        when(_todoUseCase.updateTodo(
                title: toDoItemEntityMock.title,
                dateTime: toDoItemEntityMock.date,
                isCompleted: true))
            .thenAnswer((realInvocation) => todoEntitiesMock);
        return TodoBloc(_todoUseCase);
      },
      act: (bloc) => bloc.add(
        TodoUpdateEvent(
            pageType: ToDoPageType.incomplete,
            entity: toDoItemEntityMock,
            isSelected: true),
      ),
      expect: [isA<TodoLoading>(), isA<TodoAdded>()],
    );

    blocTest<TodoBloc, TodoState>(
      'emits [TodoLoading, TodoAdded] '
      'when todo is updated with page complete',
      build: () {
        when(_todoUseCase.updateTodo(
                title: toDoItemEntityMock.title,
                dateTime: toDoItemEntityMock.date,
                isCompleted: true))
            .thenAnswer((realInvocation) => todoEntitiesMock);
        return TodoBloc(_todoUseCase);
      },
      act: (bloc) => bloc.add(
        TodoUpdateEvent(
            pageType: ToDoPageType.completed,
            entity: toDoItemEntityMock,
            isSelected: true),
      ),
      expect: [isA<TodoLoading>(), isA<TodoAdded>()],
    );
  });

  group('TodoBloc Loaded Todo Event To State', () {
    blocTest<TodoBloc, TodoState>(
      'emits [TodoLoading, TodoAdded] when todo is loaded with page all',
      build: () {
        when(_todoUseCase.loadTodos())
            .thenAnswer((realInvocation) => todoEntitiesMock);
        return TodoBloc(_todoUseCase);
      },
      act: (bloc) => bloc.add(TodoLoadedEvent(ToDoPageType.all)),
      expect: [isA<TodoLoading>(), isA<TodoLoaded>()],
    );

    blocTest<TodoBloc, TodoState>(
      'emits [TodoLoading, TodoAdded] '
      'when todo is loaded with page incomplete',
      build: () {
        when(_todoUseCase.loadTodos())
            .thenAnswer((realInvocation) => todoEntitiesMock);
        return TodoBloc(_todoUseCase);
      },
      act: (bloc) => bloc.add(TodoLoadedEvent(ToDoPageType.incomplete)),
      expect: [isA<TodoLoading>(), isA<TodoLoaded>()],
    );

    blocTest<TodoBloc, TodoState>(
      'emits [TodoLoading, TodoAdded] '
      'when todo is loaded with page complete',
      build: () {
        when(_todoUseCase.loadTodos())
            .thenAnswer((realInvocation) => todoEntitiesMock);
        return TodoBloc(_todoUseCase);
      },
      act: (bloc) => bloc.add(TodoLoadedEvent(ToDoPageType.completed)),
      expect: [isA<TodoLoading>(), isA<TodoLoaded>()],
    );
  });
}
