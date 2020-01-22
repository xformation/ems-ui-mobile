import 'package:ems/business/store.dart';
import 'package:flutter/material.dart';
import 'package:ems/attendance/mark_attendance.dart';

void main(){
  final store = createReduxStore();
  runApp(MarkAttendancePage(store));
}
