import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main (){
  runApp(MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false,));
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //Create TimeofDay  variable
  TimeOfDay _timeOfDay = TimeOfDay(hour: 0, minute: 0);

  //show time picker method
  void _showTimepicker(){
    showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        _timeOfDay = value!;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //display the chosen time
            Text(
              _timeOfDay.format(context).toString(),
              style: TextStyle(fontSize: 40),
            ),

            //button
            MaterialButton(
                onPressed: _showTimepicker,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('PICK TIME',
                style: TextStyle(color: Colors.white,fontSize: 30),
                ),
              ),
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
