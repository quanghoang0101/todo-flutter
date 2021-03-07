part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent extends Equatable {}

class TodoLoadedEvent extends TodoEvent {
  TodoLoadedEvent(this.pageType);
  final ToDoPageType pageType;

  @override
  List<Object> get props => [pageType];
}

class TodoUpdateEvent extends TodoEvent {
  TodoUpdateEvent({this.pageType, this.entity, this.isSelected});
  final ToDoPageType pageType;
  final ToDoItemEntity entity;
  final bool isSelected;

  @override
  List<Object> get props => [pageType, entity];
}
