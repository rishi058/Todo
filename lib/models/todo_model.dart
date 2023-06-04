import 'package:get/get.dart';

class ToDoEntry{
  String task = "";
  String subtasks = "";
  String date = "";

  ToDoEntry({required this.task, required this.subtasks, required this.date});
}

class UserNotesInstance extends GetxController {
  final RxList<ToDoEntry> myNotes = <ToDoEntry>[].obs;

  void add(ToDoEntry temp){
    myNotes.add(temp);
  }

  void delete(int index){
    myNotes.removeAt(index);
  }

  void modify(ToDoEntry temp, int index){
    myNotes[index] = temp;
  }

}
