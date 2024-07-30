import "package:flutter/material.dart";
import "package:flutter_slidable/flutter_slidable.dart";

class ToDoTile extends StatefulWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  ToDoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction});

  @override
  State<ToDoTile> createState() => _ToDoTileState();
}

class _ToDoTileState extends State<ToDoTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: widget.deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(8),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: Colors.purple[200],
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              Checkbox(
                  value: widget.taskCompleted,
                  onChanged: widget.onChanged,
                  activeColor: Colors.white24),
              Text(widget.taskName,
                  style: TextStyle(
                      decoration: widget.taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
