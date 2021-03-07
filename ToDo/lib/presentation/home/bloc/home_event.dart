part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {}

class HomeAddTodoEvent extends HomeEvent {
  HomeAddTodoEvent(this.title);
  final String title;

  @override
  List<Object> get props => [title];
}
