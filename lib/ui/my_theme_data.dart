import 'dart:ui';

import 'package:flutter/material.dart';

class MyThemeData {
  static Color lightPrimary = Color(0xff5D9CEC);
  static Color lightAccent = Color(0xff61E757);
  static ThemeData lightTheme = ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0,
          backgroundColor: Colors.transparent,
          selectedIconTheme: IconThemeData(
            color: lightPrimary,
            size: 40,
          ),
        unselectedIconTheme: IconThemeData(
          color: Colors.grey,
          size: 30,
        ),
         // selectedItemColor: lightPrimary,
         // unselectedItemColor: Colors.grey,
          //
          ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: lightPrimary,
      ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,

      ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,

        )
    ),

  );
  ThemeData darkTheme = ThemeData.dark();
}
