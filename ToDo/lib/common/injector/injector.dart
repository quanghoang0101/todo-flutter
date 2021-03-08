import 'package:kiwi/kiwi.dart';

import 'package:ToDo/presentation/detail/bloc/todo_bloc.dart';
import 'package:ToDo/presentation/home/bloc/home_bloc.dart';
import 'package:ToDo/domain/usecases/todo_usecase.dart';
import 'package:ToDo/data/datasources/todo_datasource.dart';
import 'package:ToDo/data/repositories/todo_repository_impl.dart';
import 'package:ToDo/domain/repositories/todo_repository.dart';

import '__mocks__/injector_mock.dart';
part 'injector.g.dart';

abstract class Injector {
  static KiwiContainer container;

  static void setup({bool isTesting = false}) {
    container = KiwiContainer();
    final injector = _$Injector();
    if (isTesting) {
      injector._configureMock();
      return;
    }
    injector._configure();
  }

  static final resolve = container.resolve;

  void _configure() {
    _configureBlocs();
    _configureUsecases();
    _configureRepositories();
    _configureDataSources();
  }

  void _configureMock() {
    _configureModuleMock();
  }

  void _configureModuleMock() {
    MockContainer().get(container);
  }

  // ============ BLOCS ============
  @Register.factory(TodoBloc)
  @Register.factory(HomeBloc)
  void _configureBlocs();

  // ============ UseCases ============
  @Register.factory(TodoUseCase)
  void _configureUsecases();

  // ============ Repositories ============
  @Register.factory(TodoRepository, from: TodoRepositoryImpl)
  void _configureRepositories();

  // ============ DataSources ============
  @Register.singleton(TodoDataSource)
  void _configureDataSources();
}
