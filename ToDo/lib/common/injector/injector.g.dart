// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void _configureBlocs() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory((c) => TodoBloc(c<TodoUseCase>()));
    container.registerFactory((c) => HomeBloc(c<TodoUseCase>()));
  }

  @override
  void _configureUsecases() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory((c) => TodoUseCase(c<TodoRepositoryImpl>()));
  }

  @override
  void _configureRepositories() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory((c) => TodoRepositoryImpl(c<TodoDataSource>()));
  }

  @override
  void _configureDataSources() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => TodoDataSource());
  }
}
