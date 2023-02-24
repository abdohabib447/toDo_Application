import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/provider/provider.dart';
import 'package:to_do_app/ui/my_theme_data.dart';

class Mode extends StatefulWidget {
  @override
  State<Mode> createState() => _ModeState();
}

class _ModeState extends State<Mode> {
  var provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ListProvider>(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              provider.chanegeCurrentMode(ThemeMode.light);
            },
            child: Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Theme.of(context).primaryColor),
                color: provider.currentMode == ThemeMode.light
                    ? Colors.white
                    : MyThemeData.darkAccent,
              ),
              child: provider.isDarkMode()
                  ? usSelectedTheme('Light')
                  : isSelectedTheme('Light'),
            ),
          ),
          Container(
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Theme.of(context).primaryColor),
              color: provider.currentMode == ThemeMode.light
                  ? Colors.white
                  : MyThemeData.darkAccent,
            ),
            child: InkWell(
              onTap: () {
                provider.chanegeCurrentMode(ThemeMode.dark);
              },
              child: provider.isDarkMode()
                  ? isSelectedTheme("dark")
                  : usSelectedTheme('dark'),
            ),
          ),
        ],
      ),
    );
  }

  Widget isSelectedTheme(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Icon(Icons.check),
      ],
    );
  }

  Widget usSelectedTheme(String title) {
    return Text(title);
  }
}
