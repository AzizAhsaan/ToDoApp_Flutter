import 'package:hive/hive.dart';

class ToDoDataBase {
  List toDoList = [];
  // reference the box
  final _myBox = Hive.box('myBox');
  // run this method if this is the first time opening the app
  void createInitialData() {
    toDoList = [
      ["First task", false],
      ["Second task", false],
    ];
  }

  //load the data from the database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  void updateData() {
    _myBox.put("TODOLIST", toDoList);
  }
}
