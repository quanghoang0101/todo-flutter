import 'package:ToDo/domain/entities/todo_item_entity.dart';

abstract class TodoRepository {
  List<ToDoItemEntity> loadTodos();

  List<ToDoItemEntity> addTodo({String title, DateTime dateTime});

  List<ToDoItemEntity> removeTodo({String title, DateTime dateTime});

  List<ToDoItemEntity> updateTodo({
    String title,
    DateTime dateTime,
    bool isCompleted,
  });
}
