import 'package:flutter/material.dart';

class ButtomSheetScreen extends StatefulWidget {

  @override
  State<ButtomSheetScreen> createState() => _ButtomSheetScreenState();
}

class _ButtomSheetScreenState extends State<ButtomSheetScreen> {
  GlobalKey<FormState> myKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Form(
        key: myKey ,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Add new task' , style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.center,),
            TextFormField(
                 decoration: InputDecoration(
                   labelText: 'Enter your task'
                 ),
              validator: (text){
                   if(text == null || text.trim().isEmpty){
                     return ' please enter title';
                   }
              },
            ),
            TextFormField(
              maxLines: 4,
              minLines: 3,
              decoration: InputDecoration(
                labelText: 'Description'
            ),
              validator: (text){
                if(text == null || text.trim().isEmpty){
                  return ' please enter description';
                }
              },),
            SizedBox(height: 15,),
            Text('Add New Task' , textAlign: TextAlign.start,),
            SizedBox(height: 15,),
            InkWell(
              onTap: (){
                showDataBacker();
              },
              child: Text('${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}',
                textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,),
            ),
            ElevatedButton(onPressed: (){
              myKey.currentState!.validate();
            },
                child: Text('submit' , style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white
                ),)),

          ],
        ),
      ),
    );
  }

  void showDataBacker() {
    showDatePicker(context: context, 
        initialDate: DateTime.now(), 
        firstDate: DateTime.now(), 
        lastDate: DateTime.now().add(Duration(days: 365)));
  }
}
