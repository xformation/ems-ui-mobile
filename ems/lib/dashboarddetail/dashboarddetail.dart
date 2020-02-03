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
        elevation: 0.0,
        leading: Container(
          alignment: Alignment.centerLeft,
          width: 30.0,
          padding: EdgeInsets.only(left: 20.0),
          child: IconButton(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(0.0),
            icon: Icon(Icons.menu,
                color: LocalTheme.Header["title"]["title_color"]),
            iconSize: 24.0,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Container(
          alignment: Alignment(-1.2, 0.0),
          padding: EdgeInsets.all(0.0),
          child: Text(
            "Dashboard",
            style: TextStyle(
                color: LocalTheme.Header["title"]["title_color"],
                fontFamily: LocalTheme.Header["title"]["font_family"],
                fontSize: 17),
          ),
        ),
        actions: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 20.0),
            child: IconButton(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(0.0),
              icon: const Icon(Icons.notifications),
              color: LocalTheme.Header["title"]["title_color"],
              tooltip: 'Show Notifications',
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Container(
        color: Color.fromARGB(1, 250, 250, 248),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              studentprofileDetail(),
              selectAttendanceType(),
              displayAttendanceGraph(),
            ],
          ),
        ),
      ),
    );
  }

  Widget studentprofileDetail() {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8.0,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            width: 60,
            height: 60,
            padding: EdgeInsets.all(0.0),
            margin: EdgeInsets.only(left: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: Color(0xffE0E5D4),
                width: 1,
              ),
            ),
            child: Image.asset('assets/images/Image.png', fit: BoxFit.cover),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(0.0),
            width: 220,
            child: ListTile(
              title: Text(
                "Sara Adamas",
                style: TextStyle(
                    color: LocalTheme.home["student_name"]["color"],
                    fontWeight: LocalTheme.home["student_name"]["font_weight"],
                    fontFamily: LocalTheme.home["student_name"]["font_family"],
                    fontSize: 16),
              ),
              subtitle: Text(
                "8th Grade, Telangana State Boardd",
                style: TextStyle(
                  color: LocalTheme.home["student_description"]["color"],
                  fontSize: 12,
                  fontFamily: LocalTheme.home["student_description"]
                      ["font_family"],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget selectAttendanceType() {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
      padding: EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8.0,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(bottom: 15.0),
            child: Text(
              "Select Attendance Type",
              style: TextStyle(
                  color: LocalTheme.home["sub_heading"]["color"],
                  fontWeight: LocalTheme.home["sub_heading"]["font_weight"],
                  fontFamily: LocalTheme.home["sub_heading"]["font_family"],
                  fontSize: 18),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(bottom: 10.0),
            child: Row(
              children: <Widget>[
                Container(
                  width: 20.0,
                  height: 20.0,
                  margin: EdgeInsets.only(right: 15.0),
                  alignment: Alignment.centerLeft,
                  child: CheckboxListTile(
                    value: false,
                    onChanged: (newValue) {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, "/subjectwiseattendance");
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Subject Wise Attendance",
                    style: TextStyle(
                      color: LocalTheme.home["student_description"]["color"],
                      fontFamily: LocalTheme.home["student_description"]
                          ["font_family"],
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(bottom: 10.0),
            child: Row(
              children: <Widget>[
                Container(
                  width: 20.0,
                  height: 20.0,
                  margin: EdgeInsets.only(right: 15.0),
                  alignment: Alignment.centerLeft,
                  child: CheckboxListTile(
                    value: false,
                    onChanged: (newValue) {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, "/subjectwiseattendance");
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Day wise Attendance",
                    style: TextStyle(
                      color: LocalTheme.home["student_description"]["color"],
                      fontFamily: LocalTheme.home["student_description"]
                          ["font_family"],
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget displayAttendanceGraph() {
    return Container(
      height: 250.0,
      margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 0.0, bottom: 15.0),
      padding: EdgeInsets.only(bottom: 10.0, top: 10.0, left: 5.0, right: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8.0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            dense: true,
            title: Text(
              "Attendance",
              style: TextStyle(
                  color: LocalTheme.home["sub_heading"]["color"],
                  fontWeight: LocalTheme.home["sub_heading"]["font_weight"],
                  fontFamily: LocalTheme.home["sub_heading"]["font_family"],
                  fontSize: 18),
            ),
          ),
          Expanded(
            child: charts.BarChart(
              seriesList,
              animate: animate,
              primaryMeasureAxis: charts.NumericAxisSpec(
                renderSpec: charts.NoneRenderSpec(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MonthwiseAttendance {
  final String month;
  final int attendance;

  MonthwiseAttendance(this.month, this.attendance);
}
