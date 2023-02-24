import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/provider.dart';
import '../../constants.dart';
import '../../item_list_model.dart';
import 'item_list.dart';


class UpdateTodo extends StatefulWidget {
  static String routeNAme = 'update';
     @override
  State<UpdateTodo> createState() => _UpdateTodoState();
}

class _UpdateTodoState extends State<UpdateTodo> {
  GlobalKey<FormState> myKey = GlobalKey<FormState>();

  DateTime currentDate = DateTime.now();

  String title = '';

  String description = ' ';

  late var listProvider;
  @override
  Widget build(BuildContext context) {
    //var arguments = ModalRoute.of(context)?.
    listProvider = Provider.of<ListProvider>(context);
    return Scaffold(
     body: Container(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: myKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add new task',
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyMedium,
                textAlign: TextAlign.center,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Enter your task'),
                validator: (text) {
                  if (text == null || text
                      .trim()
                      .isEmpty) {
                    return ' please enter title';
                  }
                },
                onChanged: (text) {
                  title = text;
                },
              ),
              TextFormField(
                maxLines: 4,
                minLines: 3,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (text) {
                  if (text == null || text
                      .trim()
                      .isEmpty) {
                    return ' please enter description';
                  }
                },
                onChanged: (text) {
                  description = text;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Add New Task',
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  showDataBacker();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${currentDate.day} / ${currentDate.month} / ${currentDate
                        .year}',
                    textAlign: TextAlign.center,
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xffA9A9A9),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    onSubmit();
                  },
                  child: Text(
                    'submit',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void showDataBacker() async {
    currentDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365))) ??
        DateTime.now();
  }

  void onSubmit() {
    if (!myKey.currentState!.validate()) return;
    FirebaseFirestore.instance.collection(ItemModel.toDoName).doc().update({
      titleKey: title,
      desKey: description,
    }).timeout(const Duration(milliseconds: 500), onTimeout: () {
      Navigator.pop(context);
      listProvider.fetchDataFromFirebase();
    });
  }
}

