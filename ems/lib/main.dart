import 'package:ems/business/store.dart';
import 'package:ems/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:ems/home/home.dart';
import 'package:ems/attendanceform/mark_attendance.dart';
import 'package:ems/attendance/attendance.dart';
import 'package:ems/timetable/time_table.dart';
import 'package:ems/feepayment/feepayment.dart';
import 'package:ems/paymentdetail/paymentdetail.dart';
import 'package:ems/complain/complain.dart';
import 'package:ems/registercomplain/registercomplain.dart';
import 'package:ems/complaindetail/complaindetail.dart';
import 'package:ems/containers/parent_container.dart';

void main() {
  final store = createReduxStore();
  runApp(MaterialApp(initialRoute: "/", routes: {
    '/': (context) => ParentContainer(Home()),
    '/dashboard': (context) => ParentContainer(Dashboard()),
    '/attendance': (context) => ParentContainer(MarkAttendancePage(store)),
    '/AttendanceDetail': (context) => ParentContainer(AttendanceDetail()),
    '/feepayment': (context) => ParentContainer(FeePayment()),
    '/timetable': (context) => ParentContainer(TimeTable()),
    '/paymentDetail' : (context) => ParentContainer(FeePaymentDetail()),
    '/complain' : (context) => ParentContainer(Complaints()),
    '/Registercomplain' : (context) => ParentContainer(Registercomplain()),
    '/complaindetail' : (context) => ParentContainer(ComplainDetail()),
  }));
}
