import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ToDo/presentation/home/bloc/home_bloc.dart';
import 'package:ToDo/presentation/detail/bloc/todo_bloc.dart';
import 'package:ToDo/presentation/detail/widgets/placeholder_widget.dart';
import 'package:ToDo/domain/entities/todo_item_entity.dart';
import 'package:ToDo/common/constants/page_type_enum.dart';
import 'package:ToDo/common/injector/injector.dart';

import 'widgets/todo_item_widget.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({this.pageType = ToDoPageType.all});

  final ToDoPageType pageType;

  @override
  State<StatefulWidget> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  TodoBloc _todoBloc;

  @override
  void initState() {
    super.initState();
    _todoBloc = Injector.resolve<TodoBloc>();
    _todoBloc.add(TodoLoadedEvent(widget.pageType));
  }

  @override
  void dispose() {
    _todoBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeAddedTodo) {
            _loadTodos();
          }
        },
        child: BlocProvider<TodoBloc>(
          create: (_) => _todoBloc,
          child: BlocBuilder<TodoBloc, TodoState>(
            builder: (context, state) {
              if (state.isEmpty()) {
                return PlaceHolderWidget();
              }
              return ListView.builder(
                itemCount: state.items.length,
                itemBuilder: (context, index) {
                  final item = state.items[index];
                  return ToDoItemWidget(
                    title: item.title,
                    subtitle: item.dateFormatted(),
                    isSelected: item.isCompleted,
                    onSelectChanged: (value) => _onSelectChanged(value, item),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  void _onSelectChanged(bool value, ToDoItemEntity item) {
    _todoBloc.add(TodoUpdateEvent(
      pageType: widget.pageType,
      entity: item,
      isSelected: value,
    ));
  }

  void _loadTodos() {
    _todoBloc.add(TodoLoadedEvent(widget.pageType));
  }
}
