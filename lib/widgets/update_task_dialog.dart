import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/models/todo_model.dart';


class UpdateTaskAlertDialog extends StatefulWidget {
  final int index;
  final List<ToDoEntry> data;
  final Function refresh;

  const UpdateTaskAlertDialog(
      {Key? Key, required this.index, required this.data, required this.refresh})
      : super(key: Key);

  @override
  State<UpdateTaskAlertDialog> createState() => _UpdateTaskAlertDialogState();
}

class _UpdateTaskAlertDialogState extends State<UpdateTaskAlertDialog> {
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController taskDescController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    taskNameController.text = widget.data[widget.index].task;
    taskDescController.text = widget.data[widget.index].subtasks;

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return AlertDialog(
      scrollable: true,
      title: const Text(
        'Update Task',
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
                controller: taskNameController,
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  icon: const Icon(CupertinoIcons.square_list, color: Colors.brown),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: taskDescController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  icon: const Icon(CupertinoIcons.bubble_left_bubble_right, color: Colors.brown),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(widget.data[widget.index].date),
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
            final taskName = taskNameController.text;
            final taskDesc = taskDescController.text;
            ToDoEntry temp = ToDoEntry(task: taskName, subtasks: taskDesc, date: DateFormat.yMd().add_jm().format(DateTime.now()));
            widget.data[widget.index] = temp;
            widget.refresh();
            Navigator.of(context, rootNavigator: true).pop();
          },
          child: const Text('Update'),
        ),
      ],
    );
  }

}
