import 'package:flutter/material.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/widgets/update_task_dialog.dart';
import '../utils/colors.dart';
import 'delete_task_dialog.dart';

Widget customCard(int index, List<ToDoEntry> data, Function refresh){
  return Container(
    padding: const EdgeInsets.only(bottom: 20),
    margin: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      color: Colors.white,
      boxShadow: const [
        BoxShadow(
          color: AppColors.shadowColor,
          blurRadius: 5.0,
          offset: Offset(0, 5), // shadow direction: bottom right
        ),
      ],
    ),
    child: ListTile(
      leading: Container(
        width: 25,
        height: 25,
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: const CircleAvatar(
          backgroundColor: Colors.redAccent,
        ),
      ),
      title: Text(data[index].task, style: const TextStyle(fontWeight: FontWeight.w500),),
      subtitle: Text(data[index].subtasks),
      isThreeLine: true,
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(data[index].date),
          const SizedBox(height: 20),
          Expanded(
            child: PopupMenuButton(
              splashRadius: 30,
              icon: const Icon(Icons.edit),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    value: 'edit',
                    child: const Text(
                      'Edit',
                      style: TextStyle(fontSize: 13.0),
                    ),
                    onTap: () {
                      Future.delayed(
                        const Duration(seconds: 0),
                            () => showDialog(
                          context: context,
                          builder: (context) => UpdateTaskAlertDialog(index: index, data: data, refresh: refresh),
                        ),
                      );
                    },
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: const Text(
                      'Delete',
                      style: TextStyle(fontSize: 13.0),
                    ),
                    onTap: (){
                      Future.delayed(
                        const Duration(seconds: 0),
                            () => showDialog(
                          context: context,
                          builder: (context) => DeleteTaskDialog(index: index, data: data, refresh: refresh),
                        ),
                      );
                    },
                  ),
                ];
              },
            ),
          ),
        ],
      ),
    ),
  );
}