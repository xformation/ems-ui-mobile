import 'package:flutter/material.dart';
import 'package:ems/theme_data.dart';
import 'package:provider/provider.dart';
import 'package:ems/controller/menu_controller.dart';
import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:flutter_segment/flutter_segment.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => new _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<charts.Series<MonthwiseAttendance, String>> seriesList;
  final bool animate = true;

  List<charts.Series<LinearSales, int>> seriesLine;
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
      new LinearSales(0, 5),
      new LinearSales(1, 55),
      new LinearSales(2, 20),
      new LinearSales(3, 65),
      new LinearSales(3, 60),
      new LinearSales(3, 75),
    ];

    var myFakeTabletData = [
      new LinearSales(0, 10),
      new LinearSales(1, 60),
      new LinearSales(2, 30),
      new LinearSales(3, 80),
      new LinearSales(3, 70),
      new LinearSales(3, 100),
    ];

    seriesLine = [
      charts.Series<LinearSales, int>(
        id: 'Desktop',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.progress,
        data: myFakeDesktopData,
      ),
      charts.Series<LinearSales, int>(
        id: 'Tablet',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.progress,
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
            icon: Icon(Icons.menu, color: LocalTheme.home["heading"]["color"]),
            onPressed: () {
              Provider.of<MenuController>(context, listen: true).toggle();
            },
          ),
        ),
        body: Container(
            color: Color.fromARGB(1, 250, 250, 248),
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
              studentprofileDetail(),
              studentDetailRepresentChart(),
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

  Widget studentDetailRepresentChart() {
    return Container(
      height: 142.0,
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          horizontallscrollchart('barchart', 'Attendance', '2020'),
          horizontallscrollchart('barchart', 'Attendance', '2020'),
          horizontallscrollchart('barchart', 'Attendance', '2020'),
          horizontallscrollchart('barchart', 'Attendance', '2020'),
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
                primaryMeasureAxis:
                    charts.NumericAxisSpec(renderSpec: charts.NoneRenderSpec()),
              )),
            ]));
  }

  Widget studentFeesPaymentStatus() {
    return Container(
        height: 192.0,
        margin:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 0.0, bottom: 20.0),
        color: Colors.white,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                 margin: const EdgeInsets.only(left: 30.0, bottom: 9.0,top:20.0),
                  // width: 122.0,
                  // alignment: Alignment.topLeft,
                  child:ListTile(
                      //dense: true,
                      title: Text("Fee Payments",
                          style: TextStyle(
                              color: LocalTheme.home["sub_heading"]["color"],
                              fontWeight: LocalTheme.home["sub_heading"]
                                  ["font_weight"],
                              fontFamily: LocalTheme.home["sub_heading"]
                                  ["font_family"],
                              fontSize: 18)),
                      subtitle: Text("Your fee is pending for this Quarter.",
                          style: TextStyle(
                              color: LocalTheme.home["student_description"]
                                  ["color"],
                              fontSize: 14,
                              wordSpacing: 2,
                              fontFamily: LocalTheme.home["student_description"]
                                  ["font_family"])),
                      trailing: Container(
                        height: 150,
                        child: Column(children: <Widget>[
                          Image.asset('assets/images/payment_img.jpg')     
                        ],)
                      ),
                      ),
                    ),
                     Container(
                      margin: const EdgeInsets.only(left: 30.0, bottom: 29.0,top: 20.0),
                      child: RaisedButton(
                          onPressed: () {},
                          color: Color.fromRGBO(126,211,33, 1),
                          textColor: Colors.white,
                          padding: EdgeInsets.only(left: 45.0,right: 46.0,top: 13.0,bottom: 12.0),
                          child: Text('Pay Now',
                              style: TextStyle(fontSize: 20)))),
            ]));
  }

  Widget horizontallscrollchart(
      String chartname, String chartHeading, String chartSubheading) {
    return Container(
      width: 276.0,
      child: Card(
        child: Wrap(
          children: <Widget>[
            //  Expanded(
            //       child: charts.PieChart(seriesList,
            //           animate: animate,
            //           defaultRenderer: new charts.ArcRendererConfig(
            //               arcWidth: 30,
            //               startAngle: 4 / 5 * (3.14),
            //               arcLength: 7 / 5 * (3.14)))),
            ListTile(
              title: Text(chartHeading),
              subtitle: Text(chartSubheading),
            )
          ],
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

class LinearSales {
  final int year;
  final int progress;

  LinearSales(this.year, this.progress);
}
