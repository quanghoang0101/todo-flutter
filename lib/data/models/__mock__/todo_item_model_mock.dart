import 'package:ToDo/data/models/todo_item_model.dart';

ToDoItemModel todoModelMock =
    ToDoItemModel(title: 'Title 1', date: DateTime.now(), isCompleted: true);

List<ToDoItemModel> todoModelsMock = [
  ToDoItemModel(title: 'Title 1', date: DateTime.now(), isCompleted: true),
  ToDoItemModel(title: 'Title 2', date: DateTime.now(), isCompleted: true),
  ToDoItemModel(title: 'Title 3', date: DateTime.now()),
];
