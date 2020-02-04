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
  bool _value1 = false;
  bool _value2 = false;

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

  void _value2Changed(bool value) => setState(() => _value2 = value);
  void _value1Changed(bool value) => setState(() => _value1 = value);

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
            alignment: Alignment.centerRight,
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
      margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 0.0, bottom: 20.0),
      padding: EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          children: <Widget>[
            ListTile(
              dense: true,
              title: Text(
                "Select Attendance Type",
                style: TextStyle(
                    color: LocalTheme.home["sub_heading"]["color"],
                    fontWeight: LocalTheme.home["sub_heading"]["font_weight"],
                    fontFamily: LocalTheme.home["sub_heading"]["font_family"],
                    fontSize: 18),
              ),
            ),
            CheckboxListTile(
              dense: true,
              value: _value2,
              onChanged: _value2Changed,
              title: Text('Select Attendance Type',
                  style: TextStyle(
                      color: LocalTheme.home["student_description"]["color"],
                      fontWeight: LocalTheme.home["student_description"]
                          ["font_weight"],
                      fontFamily: LocalTheme.home["student_description"]
                          ["font_family"],
                      fontSize: 16)),
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.blue,
            ),
            CheckboxListTile(
              dense: true,
              value: _value1,
              onChanged: _value1Changed,
              title: Text('Subject Wise Attendance',
                  style: TextStyle(
                      color: LocalTheme.home["student_description"]["color"],
                      fontWeight: LocalTheme.home["student_description"]
                          ["font_weight"],
                      fontFamily: LocalTheme.home["student_description"]
                          ["font_family"],
                      fontSize: 16)),
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.blue,
            ),
          ],
        ),
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
