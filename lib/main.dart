import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/provider/provider.dart';
import 'package:to_do_app/ui/home/home_screens.dart';
import 'package:to_do_app/ui/my_theme_data.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore.instance.settings =
      Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);// to unlimit cachsize.
  await FirebaseFirestore.instance.disableNetwork(); // to deal with local storage.
  runApp(
      ChangeNotifierProvider(
        create: (_)=>ListProvider(),
          child: MyApp()
      )
  );
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
