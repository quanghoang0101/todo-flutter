import 'package:ToDo/domain/entities/todo_item_entity.dart';

class ToDoItemModel extends ToDoItemEntity {
  const ToDoItemModel({
    String title,
    DateTime date,
    bool isCompleted = false,
  }) : super(title: title, date: date, isCompleted: isCompleted);
}
