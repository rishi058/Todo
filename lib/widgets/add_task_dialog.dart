import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/todo_model.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class AddTaskAlertDialog extends StatefulWidget {
  const AddTaskAlertDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<AddTaskAlertDialog> createState() => _AddTaskAlertDialogState();
}

class _AddTaskAlertDialogState extends State<AddTaskAlertDialog> {
  final TextEditingController task = TextEditingController();
  final TextEditingController subtasks = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final UserNotesInstance allNotes = Get.find();

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return AlertDialog(
      scrollable: true,
      title: const Text(
        'New Task',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: Colors.brown),
      ),
      content: SizedBox(
        height: height * 0.35,
        width: width,
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: task,
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  hintText: 'Task',
                  hintStyle: const TextStyle(fontSize: 14),
                  icon: const Icon(CupertinoIcons.square_list, color: Colors.brown),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: subtasks,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  hintText: 'Subtasks',
                  hintStyle: const TextStyle(fontSize: 14),
                  icon: const Icon(CupertinoIcons.bubble_left_bubble_right, color: Colors.brown),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(DateFormat.yMd().add_jm().format(DateTime.now())),
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
            if(task.text.isEmpty && subtasks.text.isEmpty){return;}
            ToDoEntry temp = ToDoEntry(task: task.text, subtasks: subtasks.text, date: DateFormat.yMd().add_jm().format(DateTime.now()));
            allNotes.add(temp);
            _clearAll();
            Navigator.of(context, rootNavigator: true).pop();
          },
          child: const Text('Save'),
        ),
      ],
    );
  }


  void _clearAll() {
    task.text = '';
    subtasks.text = '';
  }
}
