
import 'package:flutter/material.dart';
import '../temp/dilog_box.dart';
import '../temp/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List toDoList = [
    ["Meditate",false],
    ["code", true],
  ];
  void checkBoxChanged(bool? value, int index){
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }
  void saveNewTask(){
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }
  void createNewTask(){
    showDialog(
        context: context,
        builder: (context){
          return DilogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        },
    );
  }
  @override
 Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text('To Do List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
          itemBuilder: (context, index){
          return ToDoTile(
              taskname: toDoList[index][0],
              taskcompleted: toDoList[index][1],
              onchanged: (value) => checkBoxChanged(value, index),
          );
          },
      ),
    );
  }
}