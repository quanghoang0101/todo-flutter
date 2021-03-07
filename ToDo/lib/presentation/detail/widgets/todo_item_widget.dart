import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ToDoItemWidget extends StatelessWidget {
  const ToDoItemWidget(
      {Key key,
      this.title,
      this.subtitle,
      this.isSelected,
      this.onSelectChanged})
      : super(key: key);

  final String title;
  final String subtitle;
  final bool isSelected;
  final Function(bool) onSelectChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Text(
                      subtitle,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 20.0,
              child: Checkbox(
                value: isSelected,
                onChanged: (value) => onSelectChanged(value),
              ),
            )
          ],
        ),
      ),
    );
  }
}
