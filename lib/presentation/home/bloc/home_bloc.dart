import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:ToDo/domain/entities/todo_item_entity.dart';
import 'package:ToDo/domain/usecases/todo_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.todoUseCase) : super(HomeInitial());

  final TodoUseCase todoUseCase;

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeAddTodoEvent) {
      yield* _mapAddTodoEventToState(event);
    }
  }

  Stream<HomeState> _mapAddTodoEventToState(HomeAddTodoEvent event) async* {
    yield HomeAddingTodo(state.items);

    final now = DateTime.now();
    final items = todoUseCase.addTodo(
      title: event.title,
      dateTime: now,
    );

    yield HomeAddedTodo(items);
  }
}
