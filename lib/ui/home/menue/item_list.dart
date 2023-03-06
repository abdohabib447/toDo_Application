import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/provider/provider.dart';
import 'package:to_do_app/ui/constants.dart';
import 'package:to_do_app/ui/item_list_model.dart';
import 'package:to_do_app/ui/my_theme_data.dart';

class Item extends StatelessWidget {
  ItemModel item;
  Item(this.item);
  var listaProvider;
  @override
  Widget build(BuildContext context) {
    listaProvider = Provider.of<ListProvider>(context);
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (BuildContext) {
                deleteTodo();
              },
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18),
                topLeft: Radius.circular(18),
              ),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.13,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
            color: listaProvider.isDarkMode() ?  MyThemeData.darkAccent:
            Colors.white
           ,

          ),
          child: Row(
//mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 10,
                decoration: BoxDecoration(
                    color: item.isDone
                        ? Colors.green
                        : Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(8)),
              ),
              const Spacer(
                flex: 1,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: item.isDone
                          ? Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.green)
                          : Theme.of(context).textTheme.bodyMedium!.copyWith(color: MyThemeData.lightPrimary),
                    ),
                    Text(
                      item.description,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              item.isDone
                  ? Text(
                      'Done!',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.green),
                    )
                  : ElevatedButton(
                      style: const ButtonStyle(
                        shape: MaterialStatePropertyAll(StadiumBorder(
                            side: BorderSide(
                                width: 4, color: Colors.transparent))),
                      ),
                      onPressed: () {
                        updatingDatabase();
                      },
                      child: const Icon(
                        Icons.check,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  updatingDatabase() async {
    FirebaseFirestore.instance
        .collection(ItemModel.toDoName)
        .doc(item.id)
        .update(({isDoneKey: true}));
    //     .then((value) => print("User Updated"))
    //     .catchError((error) => print("Failed to update user: $error"));
    await listaProvider.fetchDataFromFirebase();

  }

  void deleteTodo() {
    FirebaseFirestore.instance
        .collection(ItemModel.toDoName)
        .doc(item.id)
        .delete();
    listaProvider.fetchDataFromFirebase();
  }
}
