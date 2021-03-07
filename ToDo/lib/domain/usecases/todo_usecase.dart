import 'package:ToDo/domain/entities/todo_item_entity.dart';
import 'package:ToDo/domain/repositories/todo_repository.dart';

class TodoUseCase {
  TodoUseCase(this.todoRepository);

  final TodoRepository todoRepository;

  List<ToDoItemEntity> loadTodos() {
    return todoRepository.loadTodos();
  }

  List<ToDoItemEntity> addTodo({String title, DateTime dateTime}) {
    return todoRepository.addTodo(title: title, dateTime: dateTime);
  }

  List<ToDoItemEntity> updateTodo({
    String title,
    DateTime dateTime,
    bool isCompleted,
  }) {
    return todoRepository.updateTodo(
      title: title,
      dateTime: dateTime,
      isCompleted: isCompleted,
    );
  }
}
