import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:to_do_app/ui/item_list_model.dart';

import 'item_list.dart';

class MenueTab extends StatefulWidget {
  @override
  State<MenueTab> createState() => _MenueTabState();
}

class _MenueTabState extends State<MenueTab> {
  DateTime? currentDate;

  DateTime? _selectedDay;

  DateTime?  _focusedDay;
  CalendarFormat ?_calendarFormat;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
      TableCalendar(
        calendarStyle: CalendarStyle(
          outsideDaysVisible: true,

        ),
        //calendarFormat: _calendarFormat,
        onFormatChanged: (format) {
          setState(() {
            _calendarFormat = format;
          });
        },
      firstDay: DateTime.now(),
      lastDay: DateTime.utc(2024, 1, 1),
      focusedDay: DateTime.now(),
        onPageChanged: (focusedDay) {
          currentDate = focusedDay;
        },
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        },


    ),
      Expanded(
        child: ListView.builder(
          itemBuilder: (_ , index){
            return Item(ItemModel(title: 'play basketball', time: DateTime.now(),
                description: '10:30 AM', isDone: false));
            },
          itemCount: 10,
        ),
      ),

        ],
      ),
    );
  }
}
