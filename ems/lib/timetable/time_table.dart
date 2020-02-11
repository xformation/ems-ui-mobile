import 'package:flutter/material.dart';
import 'package:ems/theme_data.dart';

class TimeTable extends StatefulWidget {
  @override
  _TimeTableState createState() => new _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  @override
  void initState() {
    super.initState();
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
              "Timetable",
              style: TextStyle(
                color: LocalTheme.Header["title"]["title_color"],
                fontFamily: LocalTheme.Header["title"]["font_family"],
                fontSize: 17,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          actions: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20.0),
              child: IconButton(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.all(0.0),
                icon: const Icon(Icons.home),
                color: LocalTheme.Header["title"]["title_color"],
                // tooltip: '',
                onPressed: () {
                  Navigator.pushNamed(context, "/");
                },
              ),
            ),
          ],
        ),
        body: Container(
          color: Color.fromARGB(1, 250, 250, 248),
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              studentprofileDetail(),
              studentTimetable(),
            ]),
          ),
        ));
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

  Widget studentTimetable() {
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
                                  top: 0.0, right: 0.0, bottom: 0.0, left: 0.0),
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
          ]),
    );
  }
}
