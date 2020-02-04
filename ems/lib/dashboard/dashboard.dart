import 'package:flutter/material.dart';
import 'package:ems/theme_data.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:bezier_chart/bezier_chart.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => new _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<charts.Series<MonthwiseAttendance, String>> seriesList;
  final bool animate = true;

  List<charts.Series<StudentProgress, int>> seriesLine;
  final bool animates = true;

  @override
  void initState() {
    super.initState();
    _createSampleData();
    _createProgressData();
    // GaugeChart(this.seriesList, {this.animate});
  }

  _createSampleData() {
    final data = [
      new MonthwiseAttendance('Low', 75, Color.fromARGB(111, 184, 222, 1)),
      new MonthwiseAttendance('High', 85, Color.fromARGB(253, 202, 64, 1)),
      new MonthwiseAttendance(
          'Acceptable', 100, Color.fromARGB(38, 98, 240, 1)),
      // new MonthwiseAttendance('Highly Unusual', 5),
    ];

    seriesList = [
      new charts.Series<MonthwiseAttendance, String>(
        id: 'Attendance',
        domainFn: (MonthwiseAttendance attendance, _) => attendance.attendance,
        measureFn: (MonthwiseAttendance attendance, _) => attendance.size,
        colorFn: (MonthwiseAttendance segment, _) => segment.color,
        data: data,
      )
    ];
  }

  _createProgressData() {
    final myFakeDesktopData = [
      new StudentProgress(0, 5),
      new StudentProgress(1, 55),
      new StudentProgress(2, 20),
      new StudentProgress(3, 65),
      new StudentProgress(4, 60),
      new StudentProgress(5, 75),
    ];

    var myFakeTabletData = [
      new StudentProgress(0, 10),
      new StudentProgress(1, 60),
      new StudentProgress(2, 30),
      new StudentProgress(3, 80),
      new StudentProgress(4, 70),
      new StudentProgress(5, 100),
    ];

    seriesLine = [
      charts.Series<StudentProgress, int>(
        id: 'Desktop',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (StudentProgress sales, _) => sales.year,
        measureFn: (StudentProgress sales, _) => sales.progress,
        data: myFakeDesktopData,
      ),
      charts.Series<StudentProgress, int>(
        id: 'Tablet',
        colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
        domainFn: (StudentProgress sales, _) => sales.year,
        measureFn: (StudentProgress sales, _) => sales.progress,
        data: myFakeTabletData,
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
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: LocalTheme.home["heading"]["color"],
              size: 40,
            ),
            onPressed: () {
              Navigator.pop(context);
              // Scaffold.of(context).openDrawer();
            },
          ),
        ),
        body: Container(
            color: Color.fromARGB(1, 250, 250, 248),
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
              studentprofileDetail(),
              studentDetailRepresentChart(context),
              studentProgressChart(),
              studentFeesPaymentStatus(),
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

  Widget studentDetailRepresentChart(BuildContext context) {
    return Container(
      height: 142.0,
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          horizontallscrollchart('barchart', 'Attendance', '2020'),
          horizontallscrollnews(),
          horizontallscrollbeziarchart(context),
        ],
      ),
    );
  }

  Widget studentProgressChart() {
    return Container(
        height: 220.0,
        margin:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
        color: Colors.white,
        child: Column(
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                  dense: true,
                  title: Text("Progress",
                      style: TextStyle(
                          color: LocalTheme.home["sub_heading"]["color"],
                          fontWeight: LocalTheme.home["sub_heading"]
                              ["font_weight"],
                          fontFamily: LocalTheme.home["sub_heading"]
                              ["font_family"],
                          fontSize: 18))),
              Expanded(
                  child: charts.LineChart(
                seriesLine,
                defaultRenderer:
                    charts.LineRendererConfig(includeArea: true, stacked: true),
                animate: animates,
                primaryMeasureAxis: charts.NumericAxisSpec(
                    renderSpec: charts.NoneRenderSpec(), showAxisLine: false),
                domainAxis: new charts.NumericAxisSpec(),
              )),
            ]));
  }

  Widget studentFeesPaymentStatus() {
    return Container(
        //height: 192.0,
        margin:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 0.0, bottom: 20.0),
        color: Colors.white,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    top: 15.0, bottom: 15.0, left: 0.0, right: 0.0),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(children: [
                        Container(
                          width: 150.0,
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(bottom: 10.0, left: 15.0),
                          child: Text("Fee Payments",
                              style: TextStyle(
                                  color: LocalTheme.home["sub_heading"]
                                      ["color"],
                                  fontWeight: LocalTheme.home["sub_heading"]
                                      ["font_weight"],
                                  fontFamily: LocalTheme.home["sub_heading"]
                                      ["font_family"],
                                  fontSize: 18)),
                        ),
                        Container(
                          width: 150.0,
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(bottom: 20.0, left: 15.0),
                          child: Text("Your fee is pending for this Quarter.",
                              style: TextStyle(
                                  color: LocalTheme.home["student_description"]
                                      ["color"],
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  fontFamily:
                                      LocalTheme.home["student_description"]
                                          ["font_family"])),
                        ),
                        Container(
                            width: 140.0,
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(bottom: 0.0, left: 12.0),
                            child: RaisedButton(
                                onPressed: () {},
                                color: Color.fromRGBO(126, 211, 33, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                textColor: Colors.white,
                                padding: EdgeInsets.only(
                                    left: 35.0,
                                    right: 35.0,
                                    top: 12.0,
                                    bottom: 12.0),
                                child: Text('Pay Now',
                                    style: TextStyle(fontSize: 12))))
                      ]),
                      Column(children: [
                        Container(
                            width: 150.0,
                            alignment: Alignment.topRight,
                            padding: EdgeInsets.only(left: 30.0, right: 0.0),
                            child: Image.asset('assets/images/payment_img.jpg'))
                      ])
                    ]),
              )
            ]));
  }

  Widget horizontallscrollchart(
      String chartname, String chartHeading, String chartSubheading) {
    return Container(
        width: 276.0,
        height: 142.0,
        //  GestureDetector(
        //     onTap: () {
        //       Navigator.pushNamed(context, "/dashboardDetail");
        //     },
          child: Card(
              child: charts.PieChart(
                seriesList,
                animate: animate,
                defaultRenderer: new charts.ArcRendererConfig(
                  arcWidth: 30,
                  startAngle: 4 / 5 * (3.14),
                  arcLength: 7 / 5 * (3.14),
                ),
              ),
            ),
        );
  }

  Widget horizontallscrollnews() {
    return Container(
        width: 276.0,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(0.0),
        height: 142.0,
        child: Card(
          child: new Stack(
            alignment: AlignmentDirectional.center,
            // child: Padding(
            //   padding: EdgeInsets.only(left: 55, bottom: 5),
            // child: Wrap(
            children: <Widget>[
              Container(
                width: 200.0,
                height: 200.0,
              ),
              Image.asset('assets/images/Page-1.png'),
              ListTile(
                title: Text("New & Notifications",
                    style: TextStyle(
                        color: LocalTheme.home["student_name"]["color"],
                        fontWeight: LocalTheme.home["student_name"]
                            ["font_weight"],
                        fontFamily: LocalTheme.home["student_name"]
                            ["font_family"],
                        fontSize: 16)),
                subtitle: Text("Get all the updates here.",
                    style: TextStyle(
                        color: LocalTheme.home["student_description"]["color"],
                        fontSize: 12,
                        fontFamily: LocalTheme.home["student_description"]
                            ["font_family"])),
              )
            ],
          ),
        ));
  }

  Widget horizontallscrollbeziarchart(BuildContext context) {
    return Container(
      width: 276.0,
      height: 142.0,
      // color: Colors.red,
      // height: MediaQuery.of(context).size.height / 2,
      // width: MediaQuery.of(context).size.width * 0.9,
      child: BezierChart(
        bezierChartScale: BezierChartScale.CUSTOM,
        xAxisCustomValues: const [0, 5, 10, 15, 20, 25, 30, 35],
        series: const [
          BezierLine(
            lineColor: Colors.blueAccent,
            lineStrokeWidth: 1.0,
            data: const [
              DataPoint<double>(value: 10, xAxis: 0),
              DataPoint<double>(value: 110, xAxis: 5),
              DataPoint<double>(value: 50, xAxis: 10),
              DataPoint<double>(value: 100, xAxis: 15),
              DataPoint<double>(value: 75, xAxis: 20),
              DataPoint<double>(value: 0, xAxis: 25),
              DataPoint<double>(value: 5, xAxis: 30),
              DataPoint<double>(value: 45, xAxis: 35),
            ],
          ),
        ],
        config: BezierChartConfig(
          verticalIndicatorStrokeWidth: 2.0,
          verticalIndicatorColor: Colors.black,
          showVerticalIndicator: true,
          backgroundColor: Colors.white,
          snap: false,
        ),
      ),
    );
  }
}

class MonthwiseAttendance {
  final String attendance;
  final int size;
  final charts.Color color;

  MonthwiseAttendance(this.attendance, this.size, Color color)
      : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

class StudentProgress {
  final int year;
  final int progress;

  StudentProgress(this.year, this.progress);
}
