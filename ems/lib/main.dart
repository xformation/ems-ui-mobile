import 'package:flutter/material.dart';
import 'package:ems/home/home.dart';
// import 'package:ems/attendance/mark_attendance.dart';
// import 'package:ems/business/store.dart';
void main(){
  runApp((Ems()));
  // runApp(MarkAttendancePage(store));
}

class Ems extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Home",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage()
    );
  }
}
