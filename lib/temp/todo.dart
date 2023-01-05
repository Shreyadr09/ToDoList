import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String taskname;
  final bool taskcompleted;
  Function(bool?)? onchanged;

  ToDoTile({super.key, required this.taskname, required this.onchanged, required this.taskcompleted});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Container(
        padding: EdgeInsets.all(24),
        child: Row(
          children: [
            //checkbox
            Checkbox(
                value: taskcompleted,
                onChanged: onchanged,
              activeColor: Colors.black,
            ),
            //task
            Text(
                taskname,
              style: TextStyle(decoration: taskcompleted ? TextDecoration.lineThrough : TextDecoration.none,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
