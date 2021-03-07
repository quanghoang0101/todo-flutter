import 'package:ToDo/data/datasources/todo_datasource.dart';
import 'package:ToDo/data/models/todo_item_model.dart';
import 'package:ToDo/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl extends TodoRepository {
  TodoRepositoryImpl(this.todoDataSource);

  final TodoDataSource todoDataSource;

  @override
  List<ToDoItemModel> loadTodos() {
    return todoDataSource.loadTodos();
  }

  @override
  List<ToDoItemModel> addTodo({String title, DateTime dateTime}) {
    final ToDoItemModel item = ToDoItemModel(title: title, date: dateTime);
    return todoDataSource.addTodo(item);
  }

  @override
  List<ToDoItemModel> removeTodo({String title, DateTime dateTime}) {
    final ToDoItemModel item = ToDoItemModel(title: title, date: dateTime);
    return todoDataSource.removeTodo(item);
  }

  @override
  List<ToDoItemModel> updateTodo(
      {String title, DateTime dateTime, bool isCompleted}) {
    final ToDoItemModel item =
        ToDoItemModel(title: title, date: dateTime, isCompleted: isCompleted);
    return todoDataSource.updateTodo(item);
  }
}
