import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:ToDo/domain/usecases/todo_usecase.dart';
import 'package:ToDo/domain/entities/todo_item_entity.dart';
import 'package:ToDo/common/constants/page_type_enum.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc(this.todoUseCase) : super(TodoInitial());

  final TodoUseCase todoUseCase;

  @override
  Stream<TodoState> mapEventToState(
    TodoEvent event,
  ) async* {
    if (event is TodoUpdateEvent) {
      yield* _mapUpdateTodoEventToState(event);
    } else if (event is TodoLoadedEvent) {
      yield* _mapLoadedTodoEventToState(event);
    }
  }

  Stream<TodoState> _mapUpdateTodoEventToState(TodoUpdateEvent event) async* {
    yield TodoLoading(items: state.items);

    final entity = event.entity;
    final isSelected = event.isSelected;
    final todos = todoUseCase.updateTodo(
      title: entity.title,
      dateTime: entity.date,
      isCompleted: isSelected,
    );
    List<ToDoItemEntity> items = [];

    switch (event.pageType) {
      case ToDoPageType.all:
        items = todos;
        break;
      case ToDoPageType.completed:
        items = todos.where((element) => element.isCompleted).toList();
        break;
      case ToDoPageType.incomplete:
        items = todos.where((element) => !element.isCompleted).toList();
        break;
    }

    yield TodoAdded(items: items);
  }

  Stream<TodoState> _mapLoadedTodoEventToState(TodoLoadedEvent event) async* {
    yield TodoLoading(items: state.items);

    final List<ToDoItemEntity> todos = todoUseCase.loadTodos();
    List<ToDoItemEntity> items = [];

    switch (event.pageType) {
      case ToDoPageType.all:
        items = todos;
        break;
      case ToDoPageType.completed:
        items = todos.where((element) => element.isCompleted).toList();
        break;
      case ToDoPageType.incomplete:
        items = todos.where((element) => !element.isCompleted).toList();
        break;
    }
    yield TodoLoaded(items: items);
  }
}
