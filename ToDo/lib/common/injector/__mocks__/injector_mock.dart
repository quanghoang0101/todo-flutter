import 'package:ToDo/data/datasources/todo_datasource.dart';
import 'package:ToDo/data/repositories/todo_repository_impl.dart';
import 'package:ToDo/domain/usecases/todo_usecase.dart';
import 'package:ToDo/presentation/detail/bloc/todo_bloc.dart';
import 'package:ToDo/presentation/home/bloc/home_bloc.dart';
import 'package:kiwi/kiwi.dart';

import 'package:ToDo/presentation/detail/bloc/__mock__/todo_bloc_mock.dart';
import 'package:ToDo/presentation/home/bloc/__mock__/home_bloc_mock.dart';
import 'package:ToDo/data/datasources/__mock__/todo_datasource_mock.dart';
import 'package:ToDo/data/repositories/__mock__/todo_repository_impl_mock.dart';
import 'package:ToDo/domain/usecases/__mock__/todo_usecase_mock.dart';

class MockContainer {
  void get(KiwiContainer container) {
    container
      ..registerInstance<TodoBloc>(MockTodoBloc())
      ..registerInstance<HomeBloc>(MockHomeBloc())
      ..registerInstance<TodoDataSource>(MockTodoDataSource())
      ..registerInstance<TodoRepositoryImpl>(MockTodoRepositoryImpl())
      ..registerInstance<TodoUseCase>(MockTodoUseCase());
  }
}
