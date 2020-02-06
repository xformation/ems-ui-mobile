import 'package:flutter/material.dart';
import 'package:ems/theme_data.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:bezier_chart/bezier_chart.dart';
import 'package:fl_chart/fl_chart.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => new _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<charts.Series<MonthwiseAttendance, String>> seriesList;
  final bool animate = true;
  bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
    _createSampleData();
  }

  _createSampleData() {
    final data = [
      new MonthwiseAttendance('Low', 75, Color.fromARGB(111, 184, 222, 1)),
      new MonthwiseAttendance('High', 85, Color.fromARGB(253, 202, 64, 1)),
      new MonthwiseAttendance(
          'Acceptable', 100, Color.fromARGB(38, 98, 240, 1)),
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

  LineChartData sampleData1() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
        touchCallback: (LineTouchResponse touchResponse) {
          print(touchResponse);
        },
        handleBuiltInTouches: true,
      ),
      gridData: const FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(
            color: const Color.fromRGBO(255, 255, 255, 1),
            fontSize: 2,
          ),
          margin: 0,
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'SEPT';
              case 7:
                return 'OCT';
              case 12:
                return 'DEC';
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(
            color: const Color.fromRGBO(255, 255, 255, 1),
            fontSize: 2,
          ),
          margin: 0,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border(
          left: BorderSide(
            color: Colors.transparent,
          ),
          right: BorderSide(
            color: Colors.transparent,
          ),
          top: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      minX: 0,
      maxX: 14,
      maxY: 4,
      minY: 0,
      lineBarsData: linesBarData1(),
    );
  }

  List<LineChartBarData> linesBarData1() {
    LineChartBarData lineChartBarData1 = const LineChartBarData(
      spots: [
        FlSpot(1, 1),
        FlSpot(3, 3),
        FlSpot(5, 1.4),
        FlSpot(7, 3.4),
        FlSpot(10, 0.8),
        FlSpot(12, 4.2),
        FlSpot(15, 3.2),
      ],
      isCurved: true,
      colors: [
        Color.fromRGBO(253, 202, 64, 1),
      ],
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
    final LineChartBarData lineChartBarData2 = LineChartBarData(
      spots: [
        FlSpot(1, 2),
        FlSpot(3, 4),
        FlSpot(7, 1.2),
        FlSpot(10, 2.8),
        FlSpot(12, 2.6),
        FlSpot(15, 2.9),
      ],
      isCurved: true,
      colors: [
        Color.fromRGBO(38, 98, 240, 1),
      ],
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(show: false, colors: [
        Color(0x00aa4cfc),
      ]),
    );
    return [
      lineChartBarData1,
      lineChartBarData2,
    ];
  }

  LineChartData sampleData2() {
    return LineChartData(
      lineTouchData: const LineTouchData(
        enabled: false,
      ),
      gridData: const FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(
            color: const Color.fromRGBO(255, 255, 255, 1),
            fontSize: 2,
          ),
          margin: 0,
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'SEPT';
              case 7:
                return 'OCT';
              case 12:
                return 'DEC';
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(
            color: const Color.fromRGBO(255, 255, 255, 1),
            fontSize: 2,
          ),
          margin: 0,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border(
            left: BorderSide(
              color: Colors.transparent,
            ),
            right: BorderSide(
              color: Colors.transparent,
            ),
            top: BorderSide(
              color: Colors.transparent,
            ),
          )),
      minX: 0,
      maxX: 14,
      maxY: 6,
      minY: 0,
      lineBarsData: linesBarData2(),
    );
  }

  List<LineChartBarData> linesBarData2() {
    return [
      const LineChartBarData(
        spots: [
          FlSpot(1, 1),
          FlSpot(3, 4),
          FlSpot(5, 1.8),
          FlSpot(7, 5),
          FlSpot(10, 2),
          FlSpot(12, 2.2),
          FlSpot(13, 1.8),
        ],
        isCurved: true,
        curveSmoothness: 0,
        colors: [
          Color(0x444af699),
        ],
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: false,
        ),
      ),
      const LineChartBarData(
        spots: [
          FlSpot(1, 1),
          FlSpot(3, 2.8),
          FlSpot(7, 1.2),
          FlSpot(10, 2.8),
          FlSpot(12, 2.6),
          FlSpot(13, 3.9),
        ],
        isCurved: true,
        colors: [
          Color(0x2662F0),
        ],
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(show: true, colors: [
          Color(0x33aa4cfc),
        ]),
      ),
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
              studentDetailRepresentChart(context),
              studentProgressChart(),
              studentFeesPaymentStatus(),
            ],
          ),
        ),
      ),
    );
  }

  Widget studentprofileDetail() {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
      padding: EdgeInsets.only(top: 15.0, left: 0.0, right: 0.0, bottom: 15.0),
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
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            width: 60,
            height: 60,
            padding: EdgeInsets.all(0.0),
            margin: EdgeInsets.only(left: 20.0, right: 5.0),
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
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(0.0),
            margin: EdgeInsets.all(0.0),
            width: 220,
            child: ListTile(
              title: Text(
                "Sara Adamas",
                style: TextStyle(
                  color: LocalTheme.home["student_name"]["color"],
                  fontWeight: LocalTheme.home["student_name"]["font_weight"],
                  fontFamily: LocalTheme.home["student_name"]["font_family"],
                  fontSize: 16,
                ),
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

  Widget studentDetailRepresentChart(BuildContext context) {
    return Container(
      height: 152.0,
      padding: EdgeInsets.only(top: 5.0, right: 0.0, bottom: 5.0, left: 0.0),
      //margin: EdgeInsets.symmetric(horizontal: 0.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              print("fhjbhfbhjsa");
              Navigator.pushNamed(context, "/AttendanceDetail");
            },
            child: Container(
              width: 276.0,
              height: 142.0,
              margin: EdgeInsets.only(
                  top: 0.0, right: 20.0, bottom: 0.0, left: 70.0),
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
              child: horizontallscrollchart('barchart', 'Attendance', '2020'),
            ),
            
          ),
          horizontallscrollnews(),
          horizontallscrollbeziarchart(context),
        ],
      ),
    );
  }

  Widget studentProgressChart() {
    return Container(
      height: 220.0,
      margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            dense: true,
            title: Text(
              "Progress",
              style: TextStyle(
                color: LocalTheme.home["sub_heading"]["color"],
                fontWeight: LocalTheme.home["sub_heading"]["font_weight"],
                fontFamily: LocalTheme.home["sub_heading"]["font_family"],
                fontSize: 18,
              ),
            ),
            subtitle: Text(
              "Quarter I vs. Quarter II",
              style: TextStyle(
                color: LocalTheme.home["student_description"]["color"],
                fontFamily: LocalTheme.home["student_description"]
                    ["font_family"],
                fontSize: 12,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 0.0, left: 0.0),
              child: LineChart(
                isShowingMainData ? sampleData1() : sampleData2(),
                swapAnimationDuration: Duration(milliseconds: 250),
              ),
            ),
          ),
          // Container(
          // height: 100,
          //   RaisedButton(
          //   onPressed: () {},
          //   child: const Text('QUAR-I', style: TextStyle(fontSize: 15)),
          //   color: Color.fromARGB(252,190,87,0),
          //   textColor: Colors.black,
          // ),
          //   RaisedButton(
          //   onPressed: () {},
          //   child: const Text('QUAR-II', style: TextStyle(fontSize: 15)),
          //   color: Color.fromARGB(252,190,87,0),
          //   textColor: Colors.black38,
          // ),
        ],
      ),
    );
  }

  Widget studentFeesPaymentStatus() {
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
            padding:
                EdgeInsets.only(top: 15.0, bottom: 15.0, left: 0.0, right: 0.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      width: 150.0,
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(bottom: 10.0, left: 15.0),
                      child: Text(
                        "Fee Payments",
                        style: TextStyle(
                          color: LocalTheme.home["sub_heading"]["color"],
                          fontWeight: LocalTheme.home["sub_heading"]
                              ["font_weight"],
                          fontFamily: LocalTheme.home["sub_heading"]
                              ["font_family"],
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      width: 150.0,
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(bottom: 20.0, left: 15.0),
                      child: Text(
                        "Your fee is pending for this Quarter.",
                        style: TextStyle(
                          color: LocalTheme.home["student_description"]
                              ["color"],
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          fontFamily: LocalTheme.home["student_description"]
                              ["font_family"],
                        ),
                      ),
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
                          bottom: 12.0,
                        ),
                        child: Text(
                          'Pay Now',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 200.0,
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(left: 0.0),
                      padding: EdgeInsets.only(left: 0.0, right: 0.0),
                      child: Image.asset('assets/images/payment_img.jpg'),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget horizontallscrollchart(
      String chartname, String chartHeading, String chartSubheading) {
    return Card(
      margin: EdgeInsets.only(top: 0.0, right: 0.0, bottom: 0.0, left: 0.0),
      child: charts.PieChart(
        seriesList,
        animate: animate,
        defaultRenderer: charts.ArcRendererConfig(
          arcWidth: 10,
          startAngle: 3 / 6 * (2.0),
          arcLength: 7 / 4 * (50.0),
        ),
      ),
    );
  }

  Widget horizontallscrollnews() {
    return Container(
      width: 276.0,
      alignment: Alignment.topCenter,
      padding: EdgeInsets.all(0.0),
      height: 142.0,
      margin: EdgeInsets.only(top: 0.0, right: 20.0, bottom: 0.0, left: 0.0),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 70.0,
            padding:
                EdgeInsets.only(top: 20.0, right: 0.0, bottom: 10.0, left: 0.0),
            child: Image.asset('assets/images/Page-1.png'),
          ),
          ListTile(
            title: Center(
              child: Text(
                "New & Notifications",
                style: TextStyle(
                  color: LocalTheme.home["student_name"]["color"],
                  fontWeight: LocalTheme.home["student_name"]["font_weight"],
                  fontFamily: LocalTheme.home["student_name"]["font_family"],
                  fontSize: 16,
                ),
              ),
            ),
            subtitle: Center(
              child: Text(
                "Get all the updates here.",
                style: TextStyle(
                  color: LocalTheme.home["student_description"]["color"],
                  fontFamily: LocalTheme.home["student_description"]
                      ["font_family"],
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget horizontallscrollbeziarchart(BuildContext context) {
    return Container(
      width: 276.0,
      height: 142.0,
      margin: EdgeInsets.only(top: 0.0, right: 70.0, bottom: 0.0, left: 0.0),
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
      child: BezierChart(
        bezierChartScale: BezierChartScale.CUSTOM,
        xAxisCustomValues: const [0, 5, 10, 15, 20, 25, 30, 35, 40],
        series: const [
          BezierLine(
            lineColor: Colors.blueAccent,
            lineStrokeWidth: 1.0,
            data: const [
              DataPoint<double>(value: 10, xAxis: 0),
              DataPoint<double>(value: 150, xAxis: 5),
              DataPoint<double>(value: 50, xAxis: 10),
              DataPoint<double>(value: 130, xAxis: 15),
              DataPoint<double>(value: 75, xAxis: 20),
              DataPoint<double>(value: 0, xAxis: 25),
              DataPoint<double>(value: 90, xAxis: 30),
              DataPoint<double>(value: 65, xAxis: 35),
              DataPoint<double>(value: 95, xAxis: 40),
            ],
          ),
        ],
        config: BezierChartConfig(
          verticalIndicatorStrokeWidth: 2.0,
          verticalIndicatorColor: Colors.black38,
          showVerticalIndicator: true,
          backgroundColor: Colors.white,
          // color: charts.ColorUtil.fromDartColor(Colors.white),
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
