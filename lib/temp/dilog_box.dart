import 'package:flutter/material.dart';
import 'package:tdl/temp/mybutton.dart';

class DilogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DilogBox({
    super.key,
    required this.controller,
  required this.onSave,
  required this.onCancel
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        child: Column(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(border: OutlineInputBorder(),
            hintText: "Add a new task",
            ),
          ),
          //buttons -> save + cancel
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //save
              MyButton(text: "Save", onpressed: onSave),
              //cancel
              const SizedBox(width: 8,),
              MyButton(text: "Cancel", onpressed: onCancel),
            ],
          ),
        ]),
      ),
    );
  }
}
