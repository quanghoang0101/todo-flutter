part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState({this.items});

  final List<ToDoItemEntity> items;

  @override
  List<Object> get props => [items];
}

class HomeInitial extends HomeState {
  HomeInitial() : super(items: []);
}

class HomeAddedTodo extends HomeState {
  const HomeAddedTodo(List<ToDoItemEntity> items) : super(items: items);
}

class HomeAddingTodo extends HomeState {
  const HomeAddingTodo(List<ToDoItemEntity> items) : super(items: items);
}
