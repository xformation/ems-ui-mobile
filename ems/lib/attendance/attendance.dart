import 'package:flutter/material.dart';
import 'package:ems/theme_data.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:table_calendar/table_calendar.dart';

class AttendanceDetail extends StatefulWidget {
  @override
  _AttendanceDetailState createState() => new _AttendanceDetailState();
}

class _AttendanceDetailState extends State<AttendanceDetail>
    with TickerProviderStateMixin {
  List<charts.Series<MonthwiseAttendance, String>> seriesList;
  final bool animate = true;

  List<charts.Series<MonthWiseStudentAttendanceChart, int>> seriesLists;
  final bool animates = true;

  bool _isVisible = true;
  bool _isDaywise = false;
  bool _issubjectWise = false;

  String _studentAttrndance = '';
  TabController _tabController;
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _isVisible = true;
    _calendarController = CalendarController();
    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(_handleTabChange);
    _createSampleData();
    _createAttendanceData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _calendarController.dispose();
    super.dispose();
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

  _createAttendanceData() {
    final data = [
      MonthWiseStudentAttendanceChart(0, 110, Color(0xFF2662F0)),
      MonthWiseStudentAttendanceChart(1, 25, Color(0xFF6FB8DE)),
      MonthWiseStudentAttendanceChart(2, 10, Color(0xFFFDCA40)),
    ];

    seriesLists = [
      new charts.Series<MonthWiseStudentAttendanceChart, int>(
        id: 'Attendance',
        domainFn: (MonthWiseStudentAttendanceChart attendance, _) =>
            attendance.attendance,
        measureFn: (MonthWiseStudentAttendanceChart attendance, _) =>
            attendance.size,
        colorFn: (MonthWiseStudentAttendanceChart segment, _) => segment.color,
        data: data,
        labelAccessorFn: (MonthWiseStudentAttendanceChart row, _) =>
            '${row.attendance}: ${row.size}',
      )
    ];
  }

  void _displayAttendance(value) {
    setState(() {
      _studentAttrndance = value;
      _isVisible = false;
      if (value == 'subject') {
        _issubjectWise = true;
        _isDaywise = false;
      } else if (value == 'day') {
        _issubjectWise = false;
        _isDaywise = true;
      }
    });
  }

  _handleTabChange() {
    if (_tabController.indexIsChanging) {
      setState(() {
        if (_tabController.index == 0) {
          _issubjectWise = false;
          _isDaywise = true;
          _studentAttrndance = 'day';
        } else if (_tabController.index == 1) {
          _issubjectWise = true;
          _isDaywise = false;
          _studentAttrndance = 'subject';
        }
      });
    }
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
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: LocalTheme.home["heading"]["color"],
              size: 40,
            ),
            iconSize: 24.0,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Container(
          alignment: Alignment(-1.1, 0.0),
          padding:
              EdgeInsets.only(top: 5.0, right: 0.0, bottom: 0.0, left: 0.0),
          child: Text(
            "Attendance",
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
              Visibility(
                visible: _isVisible,
                child: displayAttendanceGraph(),
              ),
              Visibility(
                visible: !_isVisible,
                child: tabForViewAttendance(),
              )
              //subjectwiseAttendance(),
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
                "Subject Wise Attendance",
                style: TextStyle(
                  color: LocalTheme.home["sub_heading"]["color"],
                  fontWeight: LocalTheme.home["sub_heading"]["font_weight"],
                  fontFamily: LocalTheme.home["sub_heading"]["font_family"],
                  fontSize: 18,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Radio(
                  value: 'day',
                  onChanged: _displayAttendance,
                  activeColor: Colors.black38,
                  groupValue: _studentAttrndance,
                ),
                Text(
                  'Subject Wise Attendance',
                  style: TextStyle(
                    color: LocalTheme.home["student_description"]["color"],
                    fontWeight: LocalTheme.home["student_description"]
                        ["font_weight"],
                    fontFamily: LocalTheme.home["student_description"]
                        ["font_family"],
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              Radio(
                value: 'subject',
                onChanged: _displayAttendance,
                groupValue: _studentAttrndance,
                activeColor: Colors.black38,
              ),
              Text(
                'Day wise Attendance',
                style: TextStyle(
                  color: LocalTheme.home["student_description"]["color"],
                  fontWeight: LocalTheme.home["student_description"]
                      ["font_weight"],
                  fontFamily: LocalTheme.home["student_description"]
                      ["font_family"],
                  fontSize: 16,
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget tabForViewAttendance() {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 0.0, bottom: 20.0),
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
            // DropdownButton<String>(
            //   isExpanded: true,
            //   // hint: Text("Please choose a subject"),
            //   items: <String>['Physics', 'Maths', 'English', 'Chemistry']
            //       .map((String value) {
            //     return new DropdownMenuItem<String>(
            //       //value: _selected,
            //       child: new Text(value),
            //     );
            //   }).toList(),
            //   onChanged: (value) {
            //     //setState(() => _selected = value);
            //   },
            // ),
            Container(
              color: Color(0xFFFAFBFD),
              padding: EdgeInsets.only(bottom: 5.0),
              child: TableCalendar(
              headerVisible : true,
              calendarController: _calendarController,
            ),
            ),
            PreferredSize(
              preferredSize: Size.fromHeight(54.0),
              child: TabBar(
                controller: _tabController,
                indicatorColor: Colors.yellow[300],
                unselectedLabelColor: LocalTheme.Tab["heading"]
                    ["unactive_color"],
                labelColor: LocalTheme.Tab["heading"]["active_color"],
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      "Week View",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: LocalTheme.Tab["heading"]["font_family"],
                        fontWeight: LocalTheme.Tab["heading"]["font_weight"],
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Month View",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: LocalTheme.Tab["heading"]["font_family"],
                        fontWeight: LocalTheme.Tab["heading"]["font_weight"],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Visibility(
              visible: _isDaywise,
              child: Container(
                color: Colors.white,
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(
                    top: 30.0, right: 30.0, bottom: 30.0, left: 30.0),
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(
                              top: 0.0, right: 0.0, bottom: 3.0, left: 20.0),
                          height: 25,
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 160,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(
                                    top: 0.0,
                                    right: 0.0,
                                    bottom: 0.0,
                                    left: 22.0),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAF8),
                                ),
                                child: Text(
                                  "DAY",
                                  style: TextStyle(
                                    color: LocalTheme.home["student_name"]
                                        ["color"],
                                    fontWeight: LocalTheme.home["student_name"]
                                        ["font_weight"],
                                    fontFamily: LocalTheme.home["student_name"]
                                        ["font_family"],
                                    fontSize: 9,
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(
                                    top: 0.0,
                                    right: 0.0,
                                    bottom: 0.0,
                                    left: 0.0),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAF8),
                                ),
                                child: Text(
                                  "ATTENDANCE",
                                  style: TextStyle(
                                    color: LocalTheme.home["student_name"]
                                        ["color"],
                                    fontWeight: LocalTheme.home["student_name"]
                                        ["font_weight"],
                                    fontFamily: LocalTheme.home["student_name"]
                                        ["font_family"],
                                    fontSize: 9,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(
                              top: 0.0, right: 0.0, bottom: 2.0, left: 20.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 160,
                                height: 25,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(
                                    top: 0.0,
                                    right: 0.0,
                                    bottom: 0.0,
                                    left: 22.0),
                                child: Text(
                                  "Monday",
                                  style: TextStyle(
                                    color: LocalTheme.home["student_name"]
                                        ["color"],
                                    fontWeight: LocalTheme.home["student_name"]
                                        ["font_weight"],
                                    fontFamily: LocalTheme.home["student_name"]
                                        ["font_family"],
                                    fontSize: 9,
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 25,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(
                                    top: 0.0,
                                    right: 0.0,
                                    bottom: 0.0,
                                    left: 13.0),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAF8),
                                ),
                                child: Text(
                                  "PRESENT",
                                  style: TextStyle(
                                    color: LocalTheme.home["student_name"]
                                        ["color"],
                                    fontWeight: LocalTheme.home["student_name"]
                                        ["font_weight"],
                                    fontFamily: LocalTheme.home["student_name"]
                                        ["font_family"],
                                    fontSize: 9,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(
                              top: 0.0, right: 0.0, bottom: 2.0, left: 20.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 160,
                                height: 25,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(
                                    top: 0.0,
                                    right: 0.0,
                                    bottom: 0.0,
                                    left: 22.0),
                                child: Text(
                                  "Tuesday",
                                  style: TextStyle(
                                    color: LocalTheme.home["student_name"]
                                        ["color"],
                                    fontWeight: LocalTheme.home["student_name"]
                                        ["font_weight"],
                                    fontFamily: LocalTheme.home["student_name"]
                                        ["font_family"],
                                    fontSize: 9,
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 25,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(
                                    top: 0.0,
                                    right: 0.0,
                                    bottom: 0.0,
                                    left: 13.0),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAF8),
                                ),
                                child: Text(
                                  "PRESENT",
                                  style: TextStyle(
                                    color: LocalTheme.home["student_name"]
                                        ["color"],
                                    fontWeight: LocalTheme.home["student_name"]
                                        ["font_weight"],
                                    fontFamily: LocalTheme.home["student_name"]
                                        ["font_family"],
                                    fontSize: 9,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(
                              top: 0.0, right: 0.0, bottom: 2.0, left: 20.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 160,
                                height: 25,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(
                                    top: 0.0,
                                    right: 0.0,
                                    bottom: 0.0,
                                    left: 22.0),
                                child: Text(
                                  "WEDNESDAY",
                                  style: TextStyle(
                                    color: LocalTheme.home["student_name"]
                                        ["color"],
                                    fontWeight: LocalTheme.home["student_name"]
                                        ["font_weight"],
                                    fontFamily: LocalTheme.home["student_name"]
                                        ["font_family"],
                                    fontSize: 9,
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 25,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(
                                    top: 0.0,
                                    right: 0.0,
                                    bottom: 0.0,
                                    left: 13.0),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAF8),
                                ),
                                child: Text(
                                  "sICK lEAVE",
                                  style: TextStyle(
                                    color: LocalTheme.home["student_name"]
                                        ["color"],
                                    fontWeight: LocalTheme.home["student_name"]
                                        ["font_weight"],
                                    fontFamily: LocalTheme.home["student_name"]
                                        ["font_family"],
                                    fontSize: 9,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(
                              top: 0.0, right: 0.0, bottom: 2.0, left: 20.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 160,
                                height: 25,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(
                                    top: 0.0,
                                    right: 0.0,
                                    bottom: 0.0,
                                    left: 22.0),
                                child: Text(
                                  "THURSDAY",
                                  style: TextStyle(
                                    color: LocalTheme.home["student_name"]
                                        ["color"],
                                    fontWeight: LocalTheme.home["student_name"]
                                        ["font_weight"],
                                    fontFamily: LocalTheme.home["student_name"]
                                        ["font_family"],
                                    fontSize: 9,
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 25,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(
                                    top: 0.0,
                                    right: 0.0,
                                    bottom: 0.0,
                                    left: 13.0),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAF8),
                                ),
                                child: Text(
                                  "PRESENT",
                                  style: TextStyle(
                                    color: LocalTheme.home["student_name"]
                                        ["color"],
                                    fontWeight: LocalTheme.home["student_name"]
                                        ["font_weight"],
                                    fontFamily: LocalTheme.home["student_name"]
                                        ["font_family"],
                                    fontSize: 9,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(
                              top: 0.0, right: 0.0, bottom: 2.0, left: 20.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 160,
                                height: 25,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(
                                    top: 0.0,
                                    right: 0.0,
                                    bottom: 0.0,
                                    left: 22.0),
                                child: Text(
                                  "FRIDAY",
                                  style: TextStyle(
                                    color: LocalTheme.home["student_name"]
                                        ["color"],
                                    fontWeight: LocalTheme.home["student_name"]
                                        ["font_weight"],
                                    fontFamily: LocalTheme.home["student_name"]
                                        ["font_family"],
                                    fontSize: 9,
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 25,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(
                                    top: 0.0,
                                    right: 0.0,
                                    bottom: 0.0,
                                    left: 13.0),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAF8),
                                ),
                                child: Text(
                                  "PRESENT",
                                  style: TextStyle(
                                    color: LocalTheme.home["student_name"]
                                        ["color"],
                                    fontWeight: LocalTheme.home["student_name"]
                                        ["font_weight"],
                                    fontFamily: LocalTheme.home["student_name"]
                                        ["font_family"],
                                    fontSize: 9,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(
                              top: 0.0, right: 0.0, bottom: 2.0, left: 20.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 160,
                                height: 25,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(
                                    top: 0.0,
                                    right: 0.0,
                                    bottom: 0.0,
                                    left: 22.0),
                                child: Text(
                                  "SATURDAY",
                                  style: TextStyle(
                                    color: LocalTheme.home["student_name"]
                                        ["color"],
                                    fontWeight: LocalTheme.home["student_name"]
                                        ["font_weight"],
                                    fontFamily: LocalTheme.home["student_name"]
                                        ["font_family"],
                                    fontSize: 9,
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 25,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(
                                    top: 0.0,
                                    right: 0.0,
                                    bottom: 0.0,
                                    left: 13.0),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFAFAF8),
                                ),
                                child: Text(
                                  "PRESENT",
                                  style: TextStyle(
                                    color: LocalTheme.home["student_name"]
                                        ["color"],
                                    fontWeight: LocalTheme.home["student_name"]
                                        ["font_weight"],
                                    fontFamily: LocalTheme.home["student_name"]
                                        ["font_family"],
                                    fontSize: 9,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
                visible: _issubjectWise,
                child: Container(
                  height: 220.0,
                  color: Colors.white,
                  // margin: EdgeInsets.only(
                  //     left: 20.0, right: 20.0, top: 0.0, bottom: 15.0),
                  // padding: EdgeInsets.only(
                  //     bottom: 10.0, top: 10.0, left: 5.0, right: 5.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: charts.PieChart(seriesLists,
                            animate: animates,
                            defaultRenderer: charts.ArcRendererConfig(
                                arcWidth: 25,
                                arcRendererDecorators: [
                                  charts.ArcLabelDecorator(
                                      labelPosition:
                                          charts.ArcLabelPosition.outside)
                                ])),
                      ),
                    ],
                  ),
                )),
          ]),
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
                fontSize: 18,
              ),
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

class MonthWiseStudentAttendanceChart {
  final int attendance;
  final int size;
  final charts.Color color;

  MonthWiseStudentAttendanceChart(this.attendance, this.size, Color color)
      : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}
