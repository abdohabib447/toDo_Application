import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../ui/constants.dart';
import '../ui/item_list_model.dart';

class ListProvider extends ChangeNotifier{
  ThemeMode currentMode = ThemeMode.system;
  List<ItemModel> todos = [];
  List result = [];
   DateTime focusedDay = DateTime.now();
  fetchDataFromFirebase() async {
    var todoCollection =
    FirebaseFirestore.instance.collection(ItemModel.toDoName);
    var data = await todoCollection.get();
    todos = data.docs.map((items) {
      var item = items.data();
      return ItemModel(
          id: item[idKey],
          title: item[titleKey],
          time: DateTime.fromMillisecondsSinceEpoch(item[dateTimeKey]),
          description: item[desKey],
          isDone: item[isDoneKey]);
    }
    ).toList();
    todos.where((element) {
      return element.time.year == focusedDay.year &&
          element.time.month == focusedDay.month &&
          element.time.day == focusedDay.day ;
    }).toList();

    todos.sort((todo1 , todo2){
      return
      todo1.time.compareTo(todo2.time);
    });
    notifyListeners();
  }
  chanegeCurrentMode(ThemeMode newMode){
    currentMode = newMode;
    notifyListeners();
  }
  bool isDarkMode() {
    return currentMode == ThemeMode.dark;
  }

}