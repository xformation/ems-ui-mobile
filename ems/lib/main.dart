import 'package:flutter/material.dart';
import 'package:ems/dashboard/home.dart';

void main(){
  runApp((Ems()));
  // runApp(MarkAttendancePage(store));
}

class Ems extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "EMS",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage()
    );
  }
}
