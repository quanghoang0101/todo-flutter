import 'package:ToDo/data/models/todo_item_model.dart';

// TODO: This class will be integrated with local datasource
// to handle persistent data
class TodoDataSource {
  final List<ToDoItemModel> _todos = [];

  List<ToDoItemModel> get todos => _todos;

  List<ToDoItemModel> loadTodos() {
    return _todos;
  }

  List<ToDoItemModel> addTodo(ToDoItemModel item) {
    _todos.insert(0, item);
    return _todos;
  }

  List<ToDoItemModel> removeTodo(ToDoItemModel item) {
    _todos.remove(item);
    return _todos;
  }

  List<ToDoItemModel> updateTodo(ToDoItemModel item) {
    final index = _todos.indexWhere((element) => element == item);
    _todos[index] = item;
    return _todos;
  }
}
