import 'package:flutter/material.dart';
import 'package:ems/theme_data.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DashboardDetail extends StatefulWidget {
  @override
  _DashboardDetailState createState() => new _DashboardDetailState();
}

class _DashboardDetailState extends State<DashboardDetail> {
  List<charts.Series<MonthwiseAttendance, String>> seriesList;
  final bool animate = true;
  @override
  void initState() {
    super.initState();
    _createSampleData();
  }

  _createSampleData() {
    final data = [
      new MonthwiseAttendance('Jan', 5),
      new MonthwiseAttendance('Feb', 25),
      new MonthwiseAttendance('Mar', 100),
      new MonthwiseAttendance('Apr', 40),
      new MonthwiseAttendance('May', 50),
      new MonthwiseAttendance('Jun', 60),
      new MonthwiseAttendance('Jul', 25),
      new MonthwiseAttendance('Aug', 35),
      new MonthwiseAttendance('Sep', 45),
      new MonthwiseAttendance('Oct', 85),
      new MonthwiseAttendance('Now', 95),
      new MonthwiseAttendance('Dec', 10),
    ];

    seriesList = [
      charts.Series<MonthwiseAttendance, String>(
        id: 'Attendance',
        colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault.darker,
        domainFn: (MonthwiseAttendance attendance, _) => attendance.month,
        measureFn: (MonthwiseAttendance attendance, _) => attendance.attendance,
        data: data,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(1, 250, 250, 248),
          title: Text("Dashboard",
              style: TextStyle(
                  color: LocalTheme.Header["title"]["title_color"],
                  fontFamily: LocalTheme.Header["title"]["font_family"],
                  fontSize: 17)),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications),
              color: LocalTheme.Header["title"]["title_color"],
              tooltip: 'Show Notifications',
              onPressed: () {},
            ),
          ],
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.menu, color: LocalTheme.home["heading"]["color"]),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        body: Container(
            color: Color.fromARGB(1, 250, 250, 248),
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
              studentprofileDetail(),
              selectAttendanceType(),
              displayAttendanceGraph(),
            ]))));
  }

  Widget studentprofileDetail() {
    return Container(
        height: 96.0,
        margin:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
        color: Colors.white,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                leading: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 44,
                    minHeight: 44,
                    maxWidth: 64,
                    maxHeight: 64,
                  ),
                  child:
                      Image.asset('assets/images/Image.png', fit: BoxFit.cover),
                ),
                title: Text("Sara Adamas",
                    style: TextStyle(
                        color: LocalTheme.home["student_name"]["color"],
                        fontWeight: LocalTheme.home["student_name"]
                            ["font_weight"],
                        fontFamily: LocalTheme.home["student_name"]
                            ["font_family"],
                        fontSize: 16)),
                subtitle: Text("8th Grade, Telangana State Boardd",
                    style: TextStyle(
                        color: LocalTheme.home["student_description"]["color"],
                        fontSize: 12,
                        fontFamily: LocalTheme.home["student_description"]
                            ["font_family"])),
              ),
            ]));
  }

  Widget selectAttendanceType() {
    return Container(
        height: 200.0,
        margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
        color: Colors.white,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                  dense: true,
                  title: Text("Select Attendance Type",
                      style: TextStyle(
                          color: LocalTheme.home["sub_heading"]["color"],
                          fontWeight: LocalTheme.home["sub_heading"]
                              ["font_weight"],
                          fontFamily: LocalTheme.home["sub_heading"]
                              ["font_family"],
                          fontSize: 16))),
              CheckboxListTile(
                  title: Text("Subject Wise Attendance",
                      style: TextStyle(
                          color: LocalTheme.home["student_description"]
                              ["color"],
                          fontFamily: LocalTheme.home["student_description"]
                              ["font_family"],
                          fontSize: 16)), //    <-- label
                  value: false,
                  onChanged: (newValue) {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/subjectwiseattendance");
                  }),
              CheckboxListTile(
                  title: Text("Day wise Attendance",
                      style: TextStyle(
                          color: LocalTheme.home["student_description"]
                              ["color"],
                          fontFamily: LocalTheme.home["student_description"]
                              ["font_family"],
                          fontSize: 16)), //    <-- label
                  value: false,
                  onChanged: (newValue) {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/subjectwiseattendance");
                  })
            ]));
  }

  Widget displayAttendanceGraph() {
    return Container(
        height: 220.0,
        margin:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 0.0, bottom: 20.0),
        color: Colors.white,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                  dense: true,
                  title: Text("Attendance",
                      style: TextStyle(
                          color: LocalTheme.home["sub_heading"]["color"],
                          fontWeight: LocalTheme.home["sub_heading"]
                              ["font_weight"],
                          fontFamily: LocalTheme.home["sub_heading"]
                              ["font_family"],
                          fontSize: 18))),
              Expanded(
                  child: charts.BarChart(
                seriesList,
                animate: animate,
                primaryMeasureAxis:
                    charts.NumericAxisSpec(renderSpec: charts.NoneRenderSpec()),
              )),
            ]));
  }
}

class MonthwiseAttendance {
  final String month;
  final int attendance;

  MonthwiseAttendance(this.month, this.attendance);
}
