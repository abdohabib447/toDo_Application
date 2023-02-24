import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/provider/provider.dart';
// import 'package:table_calendar/table_calendar.dart';

import 'item_list.dart';

class MenueTab extends StatefulWidget {
  @override
  State<MenueTab> createState() => _MenueTabState();
}

class _MenueTabState extends State<MenueTab> {
  DateTime? currentDate;

  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);
    if(listProvider.todos.isEmpty){
     listProvider.fetchDataFromFirebase() ;
    }
   // listProvider.getData();
    // var done = listProvider.getData();
    return Container(
      child: Column(
        children: [
          // TableCalendar(
          //   calendarStyle: CalendarStyle(
          //     outsideDaysVisible: true,
          //   ),
          //   //calendarFormat: _calendarFormat,
          //   onFormatChanged: (format) {
          //     setState(() {
          //       _calendarFormat = format;
          //     });
          //   },
          //   firstDay: DateTime.now(),
          //   lastDay: DateTime.utc(2024, 1, 1),
          //   focusedDay: DateTime.now(),
          //   onPageChanged: (focusedDay) {
          //     currentDate = focusedDay;
          //   },
          //   selectedDayPredicate: (day) {
          //     return isSameDay(_selectedDay, day);
          //   },
          //   onDaySelected: (selectedDay, focusedDay) {
          //     setState(() {
          //       _selectedDay = selectedDay;
          //      listProvider. focusedDay= focusedDay;
          //      listProvider.fetchDataFromFirebase();
          //       setState(() {});
          //
          //     });
          //   },
          // ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (_, index)   {
                return  Item(listProvider.todos[index]) ;
              },
              itemCount:listProvider.todos.length,
            ),
          ),
        ],
      ),
    );
  }
// xxx(){
//     var colection = FirebaseFirestore.instance.collection(ItemModel.toDoName);
//   colection.get().
// }
//   getData() async {
//     //bool result = false ;
//     var todoCollection =
//     FirebaseFirestore.instance.collection(ItemModel.toDoName);
//     var data = await todoCollection.get();
//     result = data.docs.
//     }).toList();
//   }
 }
