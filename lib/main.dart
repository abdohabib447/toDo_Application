import 'package:flutter/material.dart';
import 'package:to_do_app/ui/home/home_screens.dart';
import 'package:to_do_app/ui/my_theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreens.routeName: (_) => HomeScreens(),
      },
      initialRoute: HomeScreens.routeName,
      theme: MyThemeData.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}
