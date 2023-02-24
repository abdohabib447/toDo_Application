import 'package:flutter/material.dart';

import 'mode.dart';

class SettingTab extends StatefulWidget {
  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Mode'),
          SizedBox(height: 8,),
         InkWell(
           onTap: (){
             showBottumSheet();
           },
           child:  Container(
               padding: EdgeInsets.all(5),
               decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(18),
                   border: Border.all(color: Theme.of(context).primaryColor)
               ),
               child: Text('Light')),
         )
        ],
      ),
    );
  }

  void showBottumSheet() {
    showModalBottomSheet(context: context, builder: (_){
      return Mode();
    });
  }
}
