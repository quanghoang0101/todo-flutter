import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

import 'package:ToDo/common/constants/string_formatter.dart';

class ToDoItemEntity extends Equatable {
  const ToDoItemEntity({this.title, this.date, this.isCompleted = false});

  final String title;
  final DateTime date;
  final bool isCompleted;

  @override
  List<Object> get props => [date, title];

  String dateFormatted() {
    return DateFormat(StringFormatter.dateTimeFommater).format(date);
  }
}
