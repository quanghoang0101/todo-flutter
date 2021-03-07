import 'package:flutter/material.dart';

import 'package:ToDo/common/constants/image_constant.dart';
import 'package:ToDo/common/constants/string_constant.dart';

class PlaceHolderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImageConstant.todoEmpty,
            width: 266,
            height: 212,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              StringConstant.emptyTodoTitle,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            StringConstant.emptyTodoDescription,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
