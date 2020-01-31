import 'package:ems/controller/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:ems/theme_data.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
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
          title: Text("Home",
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
            icon: Icon(Icons.menu,
                color: LocalTheme.home["heading"]["color"]),
            onPressed: () {
              Provider.of<MenuController>(context, listen: true).toggle();
            },
          ),
        ),
        body: Container(
          color: Color.fromARGB(1, 250, 250, 248),
          child: SingleChildScrollView(
              child: Column(children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Text("Welcome Richard Grand!",
                  style: TextStyle(
                      color: LocalTheme.home["heading"]["color"],
                      fontWeight: LocalTheme.home["heading"]
                          ["font_weight"],
                      fontFamily: LocalTheme.home["heading"]
                          ["font_family"],
                      fontSize: 28)),
            ),
            Container(
                height: 220.0,
                margin: EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 0.0, bottom: 20.0),
                color: Colors.white,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ListTile(
                          dense: true,
                          title: Text("Select Student",
                              style: TextStyle(
                                  color: LocalTheme.home["sub_heading"]
                                      ["color"],
                                  fontWeight: LocalTheme
                                      .home["sub_heading"]["font_weight"],
                                  fontFamily: LocalTheme
                                      .home["sub_heading"]["font_family"],
                                  fontSize: 18))),
                      ListTile(
                        leading: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: 44,
                            minHeight: 44,
                            maxWidth: 64,
                            maxHeight: 64,
                          ),
                          child: Image.asset('assets/images/Image.png',
                              fit: BoxFit.cover),
                        ),
                        title: Text("Sara Adamas",
                            style: TextStyle(
                                color: LocalTheme.home["student_name"]
                                    ["color"],
                                fontWeight: LocalTheme.home["student_name"]
                                    ["font_weight"],
                                fontFamily: LocalTheme.home["student_name"]
                                    ["font_family"],
                                fontSize: 16)),
                        subtitle: Text("8th Grade, Telangana State Boardd",
                            style: TextStyle(
                                color: LocalTheme
                                    .home["student_description"]["color"],
                                fontSize: 12,
                                fontFamily:
                                    LocalTheme.home["student_description"]
                                        ["font_family"])),
                      ),
                      Divider(),
                      ListTile(
                        leading: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: 44,
                            minHeight: 44,
                            maxWidth: 64,
                            maxHeight: 64,
                          ),
                          child: Image.asset('assets/images/Image2.png',
                              fit: BoxFit.cover),
                        ),
                        title: Text("Kevin Dean",
                            style: TextStyle(
                                color: LocalTheme.home["student_name"]
                                    ["color"],
                                fontWeight: LocalTheme.home["student_name"]
                                    ["font_weight"],
                                fontFamily: LocalTheme.home["student_name"]
                                    ["font_family"],
                                fontSize: 16)),
                        subtitle: Text("10th Grade, Telangana State Board",
                            style: TextStyle(
                                color: LocalTheme
                                    .home["student_description"]["color"],
                                fontSize: 12,
                                fontFamily:
                                    LocalTheme.home["student_description"]
                                        ["font_family"])),
                      ),
                    ])),
            Container(
                height: 220.0,
                margin: EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 0.0, bottom: 20.0),
                color: Colors.white,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ListTile(
                          dense: true,
                          title: Text("News and Notifications",
                              style: TextStyle(
                                  color: LocalTheme.home["sub_heading"]
                                      ["color"],
                                  fontWeight: LocalTheme
                                      .home["sub_heading"]["font_weight"],
                                  fontFamily: LocalTheme
                                      .home["sub_heading"]["font_family"],
                                  fontSize: 18))),
                      ListTile(
                        leading: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: 44,
                            minHeight: 44,
                            maxWidth: 64,
                            maxHeight: 64,
                          ),
                          child: Image.asset('assets/images/indian.png',
                              fit: BoxFit.cover),
                        ),
                        title: Text("Republic Day",
                            style: TextStyle(
                                color: LocalTheme.home["student_name"]
                                    ["color"],
                                fontWeight: LocalTheme.home["student_name"]
                                    ["font_weight"],
                                fontFamily: LocalTheme.home["student_name"]
                                    ["font_family"],
                                fontSize: 16)),
                        subtitle: Text("9:00 am, 26th January, 2020",
                            style: TextStyle(
                                color: LocalTheme
                                    .home["student_description"]["color"],
                                fontSize: 12,
                                fontFamily:
                                    LocalTheme.home["student_description"]
                                        ["font_family"])),
                      ),
                      Divider(),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage('https://i.pravatar.cc/300'),
                          radius: 30.0,
                        ),
                        title: Text("Annual Day Celebrations",
                            style: TextStyle(
                                color: LocalTheme.home["student_name"]
                                    ["color"],
                                fontWeight: LocalTheme.home["student_name"]
                                    ["font_weight"],
                                fontFamily: LocalTheme.home["student_name"]
                                    ["font_family"],
                                fontSize: 16)),
                        subtitle: Text("6:00 pm, 10th February, 2020",
                            style: TextStyle(
                                color: LocalTheme
                                    .home["student_description"]["color"],
                                fontSize: 12,
                                fontFamily:
                                    LocalTheme.home["student_description"]
                                        ["font_family"])),
                      ),
                    ])),
            Container(
                height: 220.0,
                margin: EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 0.0, bottom: 20.0),
                color: Colors.white,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ListTile(
                          dense: true,
                          title: Text("Attendance",
                              style: TextStyle(
                                  color: LocalTheme.home["sub_heading"]
                                      ["color"],
                                  fontWeight: LocalTheme
                                      .home["sub_heading"]["font_weight"],
                                  fontFamily: LocalTheme
                                      .home["sub_heading"]["font_family"],
                                  fontSize: 18))),
                      Expanded(
                          child: charts.BarChart(
                        seriesList,
                        animate: animate,
                        primaryMeasureAxis: charts.NumericAxisSpec(
                            renderSpec: charts.NoneRenderSpec()),
                      )),
                    ]))
          ])),
        ));
  }
}

class MonthwiseAttendance {
  final String month;
  final int attendance;

  MonthwiseAttendance(this.month, this.attendance);
}