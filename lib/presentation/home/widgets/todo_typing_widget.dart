import 'package:flutter/material.dart';

import 'package:ToDo/common/constants/string_constant.dart';

class ToDoTypingWidget extends StatefulWidget {
  const ToDoTypingWidget({Key key, this.onSendValue}) : super(key: key);

  final Function(String) onSendValue;

  @override
  State<StatefulWidget> createState() => _ToDoTypingWidgetState();
}

class _ToDoTypingWidgetState extends State<ToDoTypingWidget> {
  final TextEditingController _textEditingController = TextEditingController();

  bool _isTypedToDo = false;

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {
      setState(() {
        _isTypedToDo = _textEditingController.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 40,
              child: TextField(
                controller: _textEditingController,
                textInputAction: TextInputAction.send,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    filled: true,
                    hintStyle: const TextStyle(color: Colors.black38),
                    hintText: StringConstant.typeTodoPlaceHolder,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 8,
                    ),
                    fillColor: Colors.white70),
              ),
            ),
          ),
          FlatButton(
            onPressed: !_isTypedToDo
                ? null
                : () {
                    widget.onSendValue(_textEditingController.text);
                    _textEditingController.text = '';
                    FocusScope.of(context).unfocus();
                  },
            shape: const CircleBorder(),
            disabledColor: Colors.black12,
            color:
                _isTypedToDo ? Theme.of(context).primaryColor : Colors.black12,
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
