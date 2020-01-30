import 'package:ems/controller/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:ems/theme_data.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => new _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<charts.Series<OrdinalSales, String>> seriesList;
  final bool animate = true;

  @override
  void initState() {
    super.initState();
    _createSampleData();
  }

  _createSampleData() {
    final data = [
      new OrdinalSales('Jan', 5),
      new OrdinalSales('Feb', 25),
      new OrdinalSales('Mar', 100),
      new OrdinalSales('Apr', 40),
      new OrdinalSales('May', 50),
      new OrdinalSales('Jun', 60),
      new OrdinalSales('Jul', 25),
      new OrdinalSales('Aug', 35),
      new OrdinalSales('Sep', 45),
      new OrdinalSales('Oct', 85),
      new OrdinalSales('Now', 95),
      new OrdinalSales('Dec', 10),
    ];

    seriesList = [
      charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.month,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(1, 250, 250, 248),
          title: Text("Home",style: TextStyle(
                      color: LocalTheme.Header["title"]["title_color"],
                      fontFamily: LocalTheme.Header["title"]
                          ["font_family"],
                      fontSize: 17)),
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
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
              margin: EdgeInsets.only(
                  left: 30.0, right: 27.0, top: 20.0, bottom: 20.0),
              child: Text("Welcome Richard Grand!",
                  style: TextStyle(
                      color: LocalTheme.dashboard["heading"]["color"],
                      fontWeight: LocalTheme.dashboard["heading"]
                          ["font_weight"],
                      fontFamily: LocalTheme.dashboard["heading"]
                          ["font_family"],
                      fontSize: 28)),
            ),
            Container(
                height: 220.0,
                margin: EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 0.0, bottom: 20.0),
                // margin: EdgeInsets.all(15.0),
                color: Colors.white,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                          child: ListView(children: <Widget>[
                        ListTile(
                            dense: true,
                            title: Text("Select Student",
                                style: TextStyle(
                                    color: LocalTheme.dashboard["sub_heading"]
                                        ["color"],
                                    fontWeight:
                                        LocalTheme.dashboard["sub_heading"]
                                            ["font_weight"],
                                    fontFamily:
                                        LocalTheme.dashboard["sub_heading"]
                                            ["font_family"],
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
                                  color: LocalTheme.dashboard["student_name"]
                                      ["color"],
                                  fontWeight: LocalTheme
                                      .dashboard["student_name"]["font_weight"],
                                  fontFamily: LocalTheme
                                      .dashboard["student_name"]["font_family"],
                                  fontSize: 16)),
                          subtitle: Text("8th Grade, Telangana State Boardd",
                              style: TextStyle(
                                  color: LocalTheme
                                          .dashboard["student_description"]
                                      ["color"],
                                  fontSize: 12,
                                  fontFamily: LocalTheme
                                          .dashboard["student_description"]
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
                                  color: LocalTheme.dashboard["student_name"]
                                      ["color"],
                                  fontWeight: LocalTheme
                                      .dashboard["student_name"]["font_weight"],
                                  fontFamily: LocalTheme
                                      .dashboard["student_name"]["font_family"],
                                  fontSize: 16)),
                          subtitle: Text("10th Grade, Telangana State Board",
                              style: TextStyle(
                                  color: LocalTheme
                                          .dashboard["student_description"]
                                      ["color"],
                                  fontSize: 12,
                                  fontFamily: LocalTheme
                                          .dashboard["student_description"]
                                      ["font_family"])),
                        ),
                      ]))
                    ])),
            // ])),
            Container(
                height: 220.0,
                margin: EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 0.0, bottom: 20.0),
                color: Colors.white,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                          child: ListView(children: <Widget>[
                        ListTile(
                            dense: true,
                            title: Text("News and Notifications",
                                style: TextStyle(
                                    color: LocalTheme.dashboard["sub_heading"]
                                        ["color"],
                                    fontWeight:
                                        LocalTheme.dashboard["sub_heading"]
                                            ["font_weight"],
                                    fontFamily:
                                        LocalTheme.dashboard["sub_heading"]
                                            ["font_family"],
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
                                  color: LocalTheme.dashboard["student_name"]
                                      ["color"],
                                  fontWeight: LocalTheme
                                      .dashboard["student_name"]["font_weight"],
                                  fontFamily: LocalTheme
                                      .dashboard["student_name"]["font_family"],
                                  fontSize: 16)),
                          subtitle: Text("9:00 am, 26th January, 2020",
                              style: TextStyle(
                                  color: LocalTheme
                                          .dashboard["student_description"]
                                      ["color"],
                                  fontSize: 12,
                                  fontFamily: LocalTheme
                                          .dashboard["student_description"]
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
                                  color: LocalTheme.dashboard["student_name"]
                                      ["color"],
                                  fontWeight: LocalTheme
                                      .dashboard["student_name"]["font_weight"],
                                  fontFamily: LocalTheme
                                      .dashboard["student_name"]["font_family"],
                                  fontSize: 16)),
                          subtitle: Text("6:00 pm, 10th February, 2020",
                              style: TextStyle(
                                  color: LocalTheme
                                          .dashboard["student_description"]
                                      ["color"],
                                  fontSize: 12,
                                  fontFamily: LocalTheme
                                          .dashboard["student_description"]
                                      ["font_family"])),
                        ),
                      ])),
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

class OrdinalSales {
  final String month;
  final int sales;

  OrdinalSales(this.month, this.sales);
}
