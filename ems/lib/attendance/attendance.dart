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
  bool _istableview = false;

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
      _istableview = true;
      _studentAttrndance = value;
      _isVisible = false;
    });
    if (value == 'subject') {
      setState(() {
        _issubjectWise = true;
        _isDaywise = false;
      });
      _tabController.index = 0;
    } else if (value == 'day') {
      setState(() {
        _issubjectWise = false;
        _isDaywise = false;
        _istableview = false;
      });
      // _tabController.index = 0;
    }
  }

  _handleTabChange() {
    if (_tabController.indexIsChanging) {
      setState(() {
        if (_tabController.index == 0) {
          _issubjectWise = false;
          _isDaywise = true;
          _studentAttrndance = 'subject';
        } else if (_tabController.index == 1) {
          _issubjectWise = true;
          _isDaywise = false;
          // _studentAttrndance = 'day';
        }
      });
    }
  }

  String _dropdownValue = 'Physics';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(1, 250, 250, 248),
        elevation: 0.0,
        leading: Container(
          alignment: Alignment.centerLeft,
          width: 30.0,
          padding: EdgeInsets.only(left: 0.0),
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
          alignment: Alignment(-1.4, 0.0),
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
            // padding: EdgeInsets.only(right: 20.0),
            child: Row(children: <Widget>[
              GestureDetector(
                child: Image.asset(
                  'assets/images/Student.png',
                  fit: BoxFit.cover,
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    child: openalertdialog(),
                  );
                },
              ),
              IconButton(
                // alignment: Alignment.centerRight,
                padding: EdgeInsets.only(left: 20.0, right: 10.0),
                icon: Icon(Icons.home),
                iconSize: 32.0,
                color: LocalTheme.Header["title"]["title_color"],
                onPressed: () {
                  Navigator.pushNamed(context, "/");
                },
              ),
            ]),
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
                visible: (!_isVisible && _istableview),
                child: tabForViewAttendance(),
              ),
              Visibility(
                visible: (!_isVisible && !_istableview),
                child: calenderWiseAttendance(),
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
                "8th Grade, Telangana State Board",
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
                  fontSize: 14,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Radio(
                  value: 'subject',
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
                value: 'day',
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
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                  top: 30.0, bottom: 10.0, left: 24.0, right: 24.0),
              padding: EdgeInsets.only(
                  top: 10.0, bottom: 5.0, left: 15.0, right: 15.0),
              decoration: BoxDecoration(
                color: Color(0xFFFDCA40),
              ),
              child: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Color(0xFFFDCA40),
                ),
                child: DropdownButton<String>(
                  isDense: true,
                  elevation: 5,
                  iconEnabledColor: Color(0xFF292B23),
                  underline: Text(''),
                  value: _dropdownValue,
                  style: TextStyle(
                    color: Color(0xFF292B23),
                    decorationColor: Color(0xFFFDCA40),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  isExpanded: true,
                  items: <String>['Physics', 'Maths', 'English', 'Chemistry']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _dropdownValue = value;
                    });
                  },
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              color: Color(0xFFFAFBFD),
              margin: EdgeInsets.only(
                top: 0.0,
                bottom: 5.0,
                left: 24.0,
                right: 24.0,
              ),
              child: TableCalendar(
                headerVisible: true,
                startingDayOfWeek: StartingDayOfWeek.monday,
                calendarController: _calendarController,
                headerStyle: HeaderStyle(
                  centerHeaderTitle: true,
                  formatButtonVisible: false,
                  formatButtonTextStyle: TextStyle().copyWith(
                    color: Color(0xFF3E4237),
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                calendarStyle: CalendarStyle(
                  selectedColor: Colors.deepOrange[400],
                  todayColor: Colors.deepOrange[200],
                  markersColor: Colors.brown[700],
                  outsideDaysVisible: false,
                ),
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
                              top: 0.0, right: 0.0, bottom: 3.0, left: 0.0),
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
                              top: 0.0, right: 0.0, bottom: 2.0, left: 0.0),
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
                                  "MONDAY",
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
                              top: 0.0, right: 0.0, bottom: 2.0, left: 0.0),
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
                                  "TUESDAY",
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
                              top: 0.0, right: 0.0, bottom: 2.0, left: 0.0),
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
                                  "SICK lEAVE",
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
                              top: 0.0, right: 0.0, bottom: 2.0, left: 0.0),
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
                              top: 0.0, right: 0.0, bottom: 2.0, left: 0.0),
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
                              top: 0.0, right: 0.0, bottom: 2.0, left: 0.0),
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

  Widget calenderWiseAttendance() {
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
            leavesandWorkingdays(),
            Container(
              alignment: Alignment.topLeft,
              color: Color(0xFFFAFBFD),
              margin: EdgeInsets.only(
                top: 0.0,
                bottom: 5.0,
                
                left: 24.0,
                right: 24.0,
              ),
              child: TableCalendar(
                initialCalendarFormat: CalendarFormat.week,
                startingDayOfWeek: StartingDayOfWeek.monday,
                // weekendDays: weekendStyle: (
                    
                // ),
                calendarController: _calendarController,
                headerStyle: HeaderStyle(
                  centerHeaderTitle: true,
                  formatButtonVisible: false,
                  formatButtonShowsNext: false,
                ),
                calendarStyle: CalendarStyle(
                  selectedColor: Colors.blueAccent,
                  todayColor: Colors.deepOrange[200],
                  markersColor: Colors.brown[700],
                  outsideDaysVisible: false,
                ),
                onDaySelected: (date, events){
                  print(date);
                }
              ),
            ),
            Container(
              height: 50,
              color: Colors.white,
              margin: EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 0.0, bottom: 20.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
                  radius: 20.0,
                ),
                title: Text(
                  "Sick Leave",
                  style: TextStyle(
                    color: LocalTheme.attendanceCalender["title"]["color"],
                    fontFamily: LocalTheme.attendanceCalender["title"]
                        ["font_family"],
                    fontWeight: LocalTheme.attendanceCalender["title"]
                        ["font_weight"],
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(
                  "04 Feb 2020",
                  style: TextStyle(
                    color: LocalTheme.attendanceCalender["title"]["color"],
                    fontFamily: LocalTheme.attendanceCalender["title"]
                        ["font_family"],
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                color: Color(0xFFE7EBF2),
                margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Reason:"),
                    Text("Due to high fever & cough."),
                  ],
                )),
          ]),
    );
  }

  Widget openalertdialog() {
    return AlertDialog(
      contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      title: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top:0.0, bottom:15.0, left:0.0, right:0.0),
        margin: EdgeInsets.all(0.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              width: 205,
              padding: EdgeInsets.all(0.0),
              margin: EdgeInsets.all(0.0),
              child: Text(
                "Select Student",
                style: TextStyle(
                  color: LocalTheme.home["sub_heading"]["color"],
                  fontWeight: LocalTheme.home["sub_heading"]["font_weight"],
                  fontFamily: LocalTheme.home["sub_heading"]["font_family"],
                  fontSize: 14,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              width: 24,
              height: 24,
              padding: EdgeInsets.all(0.0),
              margin: EdgeInsets.all(0.0),
              child: IconButton(
                alignment: Alignment.topRight,
                padding: EdgeInsets.all(0.0),
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(bottom: 15.0),
            padding: EdgeInsets.only(bottom: 15.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1.0,
                  color: Color(0xFFFFE0E5D4),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                  child: Image.asset(
                    'assets/images/Image.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(0.0),
                  margin: EdgeInsets.all(0.0),
                  width: 200,
                  child: ListTile(
                    title: Text(
                      "Sara Adamas",
                      style: TextStyle(
                        color: LocalTheme.home["student_name"]["color"],
                        fontWeight: LocalTheme.home["student_name"]
                            ["font_weight"],
                        fontFamily: LocalTheme.home["student_name"]
                            ["font_family"],
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      "8th Grade, Telangana State Board",
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
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(bottom: 15.0),
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
                  child: Image.asset(
                    'assets/images/Image2.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(0.0),
                  margin: EdgeInsets.all(0.0),
                  width: 200,
                  child: ListTile(
                    title: Text(
                      "Kevin Dean",
                      style: TextStyle(
                          color: LocalTheme.home["student_name"]["color"],
                          fontWeight: LocalTheme.home["student_name"]
                              ["font_weight"],
                          fontFamily: LocalTheme.home["student_name"]
                              ["font_family"],
                          fontSize: 16),
                    ),
                    subtitle: Text(
                      "10th Grade, Telangana State Board",
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
          ),
        ],
      ),
    );
  }

Widget leavesandWorkingdays(){
   return Container(
      height: 80.0,
      // padding: EdgeInsets.only(top: 5.0, right: 0.0, bottom: 5.0, left: 0.0),
      // margin: EdgeInsets.symmetric(horizontal: 0.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 150.0,
            color: Colors.white,
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(0.0),
            height: 50.0,
            margin:
                EdgeInsets.only(top: 0.0, right: 1.0, bottom: 0.0, left: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListTile(
                  leading: Icon(
                    Icons.check_circle,
                    color: Colors.greenAccent,
                    size: 20.0,
                  ),
                  title: Text(
                    "01",
                    style: TextStyle(
                      color: LocalTheme.attendanceCalender["title"]["color"],
                      fontFamily: LocalTheme.attendanceCalender["title"]
                          ["font_family"],
                      fontWeight: LocalTheme.attendanceCalender["title"]
                          ["font_weight"],
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    "Leaves",
                    style: TextStyle(
                      color: LocalTheme.attendanceCalender["title"]["color"],
                      fontFamily: LocalTheme.attendanceCalender["title"]
                          ["font_family"],
                      fontWeight: LocalTheme.attendanceCalender["title"]
                          ["font_weight"],
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 150.0,
            color: Colors.white,
            alignment: Alignment.topCenter,
            height: 50.0,
            margin:
                EdgeInsets.only(top: 0.0, right: 20.0, bottom: 0.0, left: 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListTile(
                  leading: Icon(
                    Icons.check_circle,
                    color: Colors.greenAccent,
                    size: 20.0,
                  ),
                  title: Text(
                    "265",
                    style: TextStyle(
                      color: LocalTheme.attendanceCalender["title"]["color"],
                      fontFamily: LocalTheme.attendanceCalender["title"]
                          ["font_family"],
                      fontWeight: LocalTheme.attendanceCalender["title"]
                          ["font_weight"],
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    "Working Days",
                    style: TextStyle(
                      color: LocalTheme.attendanceCalender["title"]["color"],
                      fontFamily: LocalTheme.attendanceCalender["title"]
                          ["font_family"],
                      fontWeight: LocalTheme.attendanceCalender["title"]
                          ["font_weight"],
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
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


// Container(
            //   height: 100.0,
            //   color: Colors.white,
            //   alignment: Alignment.topLeft,
            //   padding: EdgeInsets.only(
            //       top: 20.0, right: 10.0, bottom: 10.0, left: 10.0),
            //   child: Row(children: <Widget>[
            //     Column(
            //       children: <Widget>[
            //         Container(
            //           alignment: Alignment.topLeft,
            //           padding: EdgeInsets.only(
            //               top: 0.0, right: 0.0, bottom: 3.0, left: 0.0),
            //           height: 70,
            //           child: Row(
            //             children: <Widget>[
            //               Container(
            //                   width: 130,
            //                   alignment: Alignment.center,
            //                   padding: EdgeInsets.only(
            //                       top: 0.0,
            //                       right: 0.0,
            //                       bottom: 8.0,
            //                       left: 10.0),
            //                   decoration: BoxDecoration(
            //                     color: Colors.white,
            //                   ),
            //                   child: Column(
            //                     children: <Widget>[
            //                       Icon(
            //                         Icons.check_circle,
            //                         color: Colors.greenAccent,
            //                         size: 20.0,
            //                       ),
            //                       Text(
            //                         "01",
            //                         style: TextStyle(
            //                           color: LocalTheme
            //                               .attendanceCalender["title"]["color"],
            //                           fontFamily:
            //                               LocalTheme.attendanceCalender["title"]
            //                                   ["font_family"],
            //                           fontWeight:
            //                               LocalTheme.attendanceCalender["title"]
            //                                   ["font_weight"],
            //                           fontSize: 16,
            //                         ),
            //                       ),
            //                       Text(
            //                         "Leaves",
            //                         style: TextStyle(
            //                           color: LocalTheme
            //                               .attendanceCalender["title"]["color"],
            //                           fontFamily:
            //                               LocalTheme.attendanceCalender["title"]
            //                                   ["font_family"],
            //                           fontWeight:
            //                               LocalTheme.attendanceCalender["title"]
            //                                   ["font_weight"],
            //                           fontSize: 16,
            //                         ),
            //                       ),
            //                     ],
            //                   )),
            //               Container(
            //                 width: 130,
            //                 alignment: Alignment.center,
            //                 padding: EdgeInsets.only(
            //                     top: 0.0, right: 0.0, bottom: 8.0, left: 0.0),
            //                 decoration: BoxDecoration(
            //                   color: Colors.white,
            //                 ),
            //                 child: Column(children: <Widget>[
            //                   Icon(
            //                     Icons.check_circle,
            //                     color: Colors.greenAccent,
            //                     size: 20.0,
            //                   ),
            //                   Text(
            //                     "265",
            //                     style: TextStyle(
            //                       color: LocalTheme.attendanceCalender["title"]
            //                           ["color"],
            //                       fontFamily:
            //                           LocalTheme.attendanceCalender["title"]
            //                               ["font_family"],
            //                       fontWeight:
            //                           LocalTheme.attendanceCalender["title"]
            //                               ["font_weight"],
            //                       fontSize: 16,
            //                     ),
            //                   ),
            //                   Text(
            //                     "Working Days",
            //                     style: TextStyle(
            //                       color: LocalTheme.attendanceCalender["title"]
            //                           ["color"],
            //                       fontFamily:
            //                           LocalTheme.attendanceCalender["title"]
            //                               ["font_family"],
            //                       fontWeight:
            //                           LocalTheme.attendanceCalender["title"]
            //                               ["font_weight"],
            //                       fontSize: 16,
            //                     ),
            //                   ),
            //                 ]),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ]),
            // ),