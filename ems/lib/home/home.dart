import 'package:ems/attendance/mark_attendance.dart';
import 'package:ems/sidemenu/sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:ems/business/store.dart';
// import 'package:ems/dashboard/dashboard.dart';

class HomePage extends StatelessWidget {
  final store = createReduxStore();
  final sideMenu = SideMenu();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        //   routes: <String, WidgetBuilder> {
        //   '/attendance': (BuildContext context) => MarkAttendancePage(store),
        // },
        drawer: sideMenu.createSideMenu(context)
        // body: DashboardPage(),
      ),
    );
  }
}
