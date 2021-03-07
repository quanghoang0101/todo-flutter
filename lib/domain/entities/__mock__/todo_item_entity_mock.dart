import 'package:ToDo/domain/entities/todo_item_entity.dart';

ToDoItemEntity toDoItemEntityMock =
    ToDoItemEntity(title: 'Title 1', date: DateTime.now(), isCompleted: true);

List<ToDoItemEntity> todoEntitiesMock = [
  ToDoItemEntity(title: 'Title 1', date: DateTime.now(), isCompleted: true),
  ToDoItemEntity(title: 'Title 2', date: DateTime.now(), isCompleted: true),
  ToDoItemEntity(title: 'Title 3', date: DateTime.now()),
];
