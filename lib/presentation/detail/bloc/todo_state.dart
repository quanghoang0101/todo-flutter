part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState({this.items, this.pageType = ToDoPageType.all});

  final List<ToDoItemEntity> items;
  final ToDoPageType pageType;

  bool isEmpty() => items.isEmpty;

  @override
  List<Object> get props => [items];
}

class TodoInitial extends TodoState {
  TodoInitial() : super(items: []);
}

class TodoAdded extends TodoState {
  const TodoAdded({List<ToDoItemEntity> items}) : super(items: items);
}

class TodoLoaded extends TodoState {
  const TodoLoaded({List<ToDoItemEntity> items}) : super(items: items);
}

class TodoLoading extends TodoState {
  const TodoLoading({List<ToDoItemEntity> items}) : super(items: items);
}
