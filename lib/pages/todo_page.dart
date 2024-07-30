import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_flutter_app/data/database.dart';
import 'package:my_flutter_app/dialog_box.dart';
import 'package:my_flutter_app/util/todo_tile.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  //reference the hive box
  final _myBox = Hive.box('myBox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // if this is the first time opening the app then create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  // Text controller
  final _controller = TextEditingController();

  // Save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      db.updateData();
      _controller.clear(); // Clear the text field after saving
    });
    Navigator.of(context).pop(); // Close the dialog
  }

  // Create new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  // CheckBox changed
  void CheckBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = value!;
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        centerTitle: true,
        elevation: 0,
        title: Text(
          "To Do App",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => CheckBoxChanged(value, index),
            deleteFunction: (context) {
              setState(() {
                db.toDoList.removeAt(index);
                db.updateData();
              });
            },
          );
        },
      ),
    );
  }
}
