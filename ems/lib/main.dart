
import 'package:ems/business/store.dart';
import 'package:ems/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:ems/home/home.dart';
import 'package:ems/attendance/mark_attendance.dart';
import 'package:ems/dashboarddetail/dashboarddetail.dart';
import 'package:ems/containers/parent_container.dart';

void main() {
  final store = createReduxStore();
  runApp(MaterialApp(initialRoute: "/", routes: {
    '/': (context) => ParentContainer(Home()),
    '/dashboard': (context) => ParentContainer(Dashboard()),
    '/attendance': (context) => ParentContainer(MarkAttendancePage(store)),
    '/dashboardDetail': (context) => ParentContainer(DashboardDetail()),
  }));
}
