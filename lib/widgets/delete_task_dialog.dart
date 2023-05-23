import 'package:flutter/material.dart';

import '../models/todo_model.dart';

class DeleteTaskDialog extends StatefulWidget {
  final Function refresh;
  final List<ToDoEntry> data;
  final int index;

  const DeleteTaskDialog({Key? key, required this.refresh, required this.data, required this.index}) : super(key: key);

  @override
  State<DeleteTaskDialog> createState() => _DeleteTaskDialogState();
}

class _DeleteTaskDialogState extends State<DeleteTaskDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: const Text(
        'Delete Task',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: Colors.brown),
      ),
      content: const SizedBox(
        child: Form(
          child: Column(
            children: <Widget>[
              Text(
                'Are you sure you want to delete this task?',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            widget.data.removeAt(widget.index);
            widget.refresh();
            Navigator.of(context, rootNavigator: true).pop();
          },
          child: const Text('Delete'),
        ),
      ],
    );
  }

}
