import 'package:flutter/material.dart';
import 'package:to_do_app/ui/home/menue/menue_tab.dart';
import 'package:to_do_app/ui/home/setting/setting_tab.dart';

import 'menue/buttom_sheet.dart';

class HomeScreens extends StatefulWidget {
  static String routeName = 'hame';

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  int currentIndex = 0;

  var tabs = [MenueTab(), SettingTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return showButtomSheetScreen();
        },
        shape: const StadiumBorder(
          side: BorderSide(color: Colors.white, width: 3),
        ),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 12,
        child: BottomNavigationBar(
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: ' '),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: ' '),
          ],
        ),
      ),
      body: tabs[currentIndex],
    );
  }

  void showButtomSheetScreen() {
    showModalBottomSheet(context: context, builder: (_){
      return ButtomSheetScreen();
    });
  }
}
