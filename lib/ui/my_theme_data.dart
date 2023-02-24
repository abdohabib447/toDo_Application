import 'dart:ui';

import 'package:flutter/material.dart';

class MyThemeData {
  static Color lightPrimary = const Color(0xff5D9CEC);
  static Color darkAccent =  const Color(0xff141922);
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xffDFECDB),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.transparent,
      selectedIconTheme: IconThemeData(
        color: lightPrimary,
        size: 40,
      ),
      unselectedIconTheme: const IconThemeData(
        color: Colors.grey,
        size: 30,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: lightPrimary,
    ),
    textTheme: const TextTheme(
        bodyMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
         // color: Colors.black,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        )),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft:Radius.circular(15) ,
          bottomLeft:Radius.circular(15),
        )
      )
    )
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xff060E1E),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: darkAccent,
      selectedIconTheme: IconThemeData(
        color: lightPrimary,
        size: 40,
      ),
      unselectedIconTheme: const IconThemeData(
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
    textTheme: const TextTheme(
        bodyMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        )),
      bottomSheetTheme:  BottomSheetThemeData(
          backgroundColor: darkAccent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft:Radius.circular(15) ,
                bottomLeft:Radius.circular(15),
              )
          )
      )
  );
}
