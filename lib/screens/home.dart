import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/widgets/task_card.dart';
import '../models/todo_model.dart';
import '../widgets/add_task_dialog.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<ToDoEntry> data = [];

  void refresh(){
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: const Text("To Do"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.calendar),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AddTaskAlertDialog(refresh: refresh, data: data);
            },
          );
        },
        child: const Icon(Icons.add),
      ),

      body: ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index){
      return customCard(index, data, refresh);
      }),
    );
  }
}

/*
Consumer<MyModel>(
builder: (context, model, widget) {

  }
),
 */