import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ToDo/common/injector/injector.dart';
import 'package:ToDo/domain/usecases/todo_usecase.dart';
import 'package:ToDo/presentation/home/bloc/home_bloc.dart';

void main() {
  TodoUseCase _todoUseCase;

  setUpAll(() {
    Injector.setup(isTesting: true);
    _todoUseCase = Injector.resolve<TodoUseCase>();
  });

  tearDownAll(() {
    Injector.container.clear();
  });

  group('HomeBloc', () {
    blocTest(
      'emits [] when nothing to do',
      build: () => HomeBloc(_todoUseCase),
      expect: [],
    );

    blocTest(
      'emits [HomeAddingTodo, HomeAddedTodo] when todo is added',
      build: () => HomeBloc(_todoUseCase),
      act: (bloc) => bloc.add(HomeAddTodoEvent('Title')),
      expect: [isA<HomeAddingTodo>(), isA<HomeAddedTodo>()],
    );
  });
}
