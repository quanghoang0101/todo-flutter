import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ToDo/presentation/detail/detail_page.dart';
import 'package:ToDo/presentation/home/widgets/todo_typing_widget.dart';
import 'package:ToDo/presentation/home/bloc/home_bloc.dart';
import 'package:ToDo/common/constants/page_type_enum.dart';
import 'package:ToDo/common/constants/string_constant.dart';
import 'package:ToDo/common/injector/injector.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> with SingleTickerProviderStateMixin {
  final List<String> _titles = [
    StringConstant.all,
    StringConstant.complete,
    StringConstant.incomplete,
  ];

  HomeBloc _todoHomeBloc;

  @override
  void initState() {
    super.initState();
    _todoHomeBloc = Injector.resolve<HomeBloc>();
  }

  @override
  void dispose() {
    _todoHomeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstant.appTitle),
        elevation: 0,
      ),
      body: BlocProvider<HomeBloc>(
        create: (_) => _todoHomeBloc,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: _buildDefaultTabbar(context),
              ),
              ToDoTypingWidget(
                onSendValue: _onAddTodo,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDefaultTabbar(BuildContext context) {
    return DefaultTabController(
      length: _titles.length,
      child: Column(
        children: <Widget>[
          Container(
            constraints: const BoxConstraints.expand(height: 40),
            color: Theme.of(context).primaryColor,
            child: TabBar(
              unselectedLabelColor: Colors.white.withOpacity(0.5),
              indicatorColor: Colors.white,
              tabs: [for (var title in _titles) Text(title)],
            ),
          ),
          const Expanded(
            child: TabBarView(
              children: [
                DetailPage(pageType: ToDoPageType.all),
                DetailPage(pageType: ToDoPageType.completed),
                DetailPage(pageType: ToDoPageType.incomplete),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _onAddTodo(String value) {
    _todoHomeBloc.add(HomeAddTodoEvent(value));
  }
}
