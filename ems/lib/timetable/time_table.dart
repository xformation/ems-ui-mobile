import 'package:flutter/material.dart';
import 'package:ems/theme_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TimeTable extends StatefulWidget {
  @override
  _TimeTableState createState() => new _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  dynamic _slider;
  bool _isMonday = true;
  @override
  void initState() {
    super.initState();
    _slider = calenderView();
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
                    padding: EdgeInsets.only(left: 20.0, right: 10.0),
                    icon: Icon(Icons.home),
                    iconSize: 32.0,
                    color: LocalTheme.Header["title"]["title_color"],
                    onPressed: () {
                      Navigator.pushNamed(context, "/");
                    },
                  ),
                ])),
          ],
        ),
        body: Container(
          color: Color.fromARGB(1, 250, 250, 248),
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              studentprofileDetail(),
              Visibility(
                visible: _isMonday,
                child: studentTimetable(_slider),
              ),
            ]),
          ),
        ));
  }

  Widget openstudentDialog() {
    return AlertDialog(
      title: Text('Rewind and remember'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('You will never be satisfied.'),
            Text('You\’re like me. I’m never satisfied.'),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Regret'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  Widget studentprofileDetail() {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
      padding: EdgeInsets.only(top: 15.0, left: 0.0, right: 0.0, bottom: 5.0),
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

  Widget studentTimetable(slider) {
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
              margin: EdgeInsets.only(
                  right: 20.0, left: 20.0, top: 20.0, bottom: 0.0),
              color: Color(0xFFFAFBFD),
              child: slider,
            ),
            Container(
              color: Colors.white,
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(
                  top: 20.0, right: 30.0, bottom: 30.0, left: 30.0),
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
                                  left: 15.0),
                              decoration: BoxDecoration(
                                color: Color(0xFFFAFAF8),
                              ),
                              child: Text(
                                "SUBEJCT",
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
                                  left: 25.0),
                              decoration: BoxDecoration(
                                color: Color(0xFFFAFAF8),
                              ),
                              child: Text(
                                "TIME",
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
                            top: 0.0, right: 0.0, bottom: 4.0, left: 0.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                                width: 160,
                                // height: 25,
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.only(
                                    top: 0.0,
                                    right: 0.0,
                                    bottom: 0.0,
                                    left: 15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "ENGLISH",
                                      style: TextStyle(
                                        color: LocalTheme
                                                .timetable["subject_heading"]
                                            ["color"],
                                        fontWeight: LocalTheme
                                                .timetable["subject_heading"]
                                            ["font_weight"],
                                        fontFamily: LocalTheme
                                                .timetable["subject_heading"]
                                            ["font_family"],
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      "Julie Wade",
                                      style: TextStyle(
                                        color: LocalTheme
                                            .timetable["sub_heading"]["color"],
                                        fontWeight:
                                            LocalTheme.timetable["sub_heading"]
                                                ["font_weight"],
                                        fontFamily:
                                            LocalTheme.timetable["sub_heading"]
                                                ["font_family"],
                                        fontSize: 9,
                                      ),
                                    ),
                                  ],
                                )),
                            Container(
                              width: 100,
                              height: 35,
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
                                "09 - 10 am",
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
                            top: 0.0, right: 0.0, bottom: 4.0, left: 0.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                                width: 160,
                                // height: 25,
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.only(
                                    top: 0.0,
                                    right: 0.0,
                                    bottom: 0.0,
                                    left: 15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "MATHS",
                                      style: TextStyle(
                                        color: LocalTheme
                                                .timetable["subject_heading"]
                                            ["color"],
                                        fontWeight: LocalTheme
                                                .timetable["subject_heading"]
                                            ["font_weight"],
                                        fontFamily: LocalTheme
                                                .timetable["subject_heading"]
                                            ["font_family"],
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      "Philip Gomez",
                                      style: TextStyle(
                                        color: LocalTheme
                                            .timetable["sub_heading"]["color"],
                                        fontWeight:
                                            LocalTheme.timetable["sub_heading"]
                                                ["font_weight"],
                                        fontFamily:
                                            LocalTheme.timetable["sub_heading"]
                                                ["font_family"],
                                        fontSize: 9,
                                      ),
                                    ),
                                  ],
                                )),
                            Container(
                              width: 100,
                              height: 35,
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
                                "10 - 11 am",
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
                            top: 0.0, right: 0.0, bottom: 4.0, left: 0.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 160,
                              // height: 25,
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.only(
                                  top: 0.0,
                                  right: 0.0,
                                  bottom: 0.0,
                                  left: 15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "BREAK",
                                    style: TextStyle(
                                      color: LocalTheme
                                              .timetable["subject_heading"]
                                          ["color"],
                                      fontWeight: LocalTheme
                                              .timetable["subject_heading"]
                                          ["font_weight"],
                                      fontFamily: LocalTheme
                                              .timetable["subject_heading"]
                                          ["font_family"],
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 35,
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
                                "11 - 15 am",
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
                            top: 0.0, right: 0.0, bottom: 4.0, left: 0.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 160,
                              // height: 25,
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(
                                  top: 0.0,
                                  right: 0.0,
                                  bottom: 0.0,
                                  left: 15.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "PHYSICS",
                                      style: TextStyle(
                                        color: LocalTheme
                                                .timetable["subject_heading"]
                                            ["color"],
                                        fontWeight: LocalTheme
                                                .timetable["subject_heading"]
                                            ["font_weight"],
                                        fontFamily: LocalTheme
                                                .timetable["subject_heading"]
                                            ["font_family"],
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      "Anthony Richards",
                                      style: TextStyle(
                                        color: LocalTheme
                                            .timetable["sub_heading"]["color"],
                                        fontWeight:
                                            LocalTheme.timetable["sub_heading"]
                                                ["font_weight"],
                                        fontFamily:
                                            LocalTheme.timetable["sub_heading"]
                                                ["font_family"],
                                        fontSize: 9,
                                      ),
                                    ),
                                  ]),
                            ),
                            Container(
                              width: 100,
                              height: 35,
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
                                "11:15 - 12:15 pm",
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
                            top: 0.0, right: 0.0, bottom: 4.0, left: 0.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 160,
                              // height: 25,
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(
                                  top: 0.0,
                                  right: 0.0,
                                  bottom: 0.0,
                                  left: 15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "LUNCH BREAK",
                                    style: TextStyle(
                                      color: LocalTheme
                                              .timetable["subject_heading"]
                                          ["color"],
                                      fontWeight: LocalTheme
                                              .timetable["subject_heading"]
                                          ["font_weight"],
                                      fontFamily: LocalTheme
                                              .timetable["subject_heading"]
                                          ["font_family"],
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 35,
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
                                "12:15 - 01:15 pm",
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
                            top: 0.0, right: 0.0, bottom: 4.0, left: 0.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 160,
                              // height: 25,
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(
                                  top: 0.0,
                                  right: 0.0,
                                  bottom: 0.0,
                                  left: 15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "HINDI",
                                    style: TextStyle(
                                      color: LocalTheme
                                              .timetable["subject_heading"]
                                          ["color"],
                                      fontWeight: LocalTheme
                                              .timetable["subject_heading"]
                                          ["font_weight"],
                                      fontFamily: LocalTheme
                                              .timetable["subject_heading"]
                                          ["font_family"],
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    "Patricia Andrews",
                                    style: TextStyle(
                                      color: LocalTheme.timetable["sub_heading"]
                                          ["color"],
                                      fontWeight:
                                          LocalTheme.timetable["sub_heading"]
                                              ["font_weight"],
                                      fontFamily:
                                          LocalTheme.timetable["sub_heading"]
                                              ["font_family"],
                                      fontSize: 9,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 35,
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
                                "01:15 - 02:15 pm",
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
                              // height: 25,
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(
                                  top: 0.0,
                                  right: 0.0,
                                  bottom: 0.0,
                                  left: 15.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "SOCIAL",
                                      style: TextStyle(
                                        color: LocalTheme
                                                .timetable["subject_heading"]
                                            ["color"],
                                        fontWeight: LocalTheme
                                                .timetable["subject_heading"]
                                            ["font_weight"],
                                        fontFamily: LocalTheme
                                                .timetable["subject_heading"]
                                            ["font_family"],
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      "Alan Riley",
                                      style: TextStyle(
                                        color: LocalTheme
                                            .timetable["sub_heading"]["color"],
                                        fontWeight:
                                            LocalTheme.timetable["sub_heading"]
                                                ["font_weight"],
                                        fontFamily:
                                            LocalTheme.timetable["sub_heading"]
                                                ["font_family"],
                                        fontSize: 9,
                                      ),
                                    ),
                                  ]),
                            ),
                            Container(
                              width: 100,
                              height: 35,
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
                                "02:15 - 03:15 pm",
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

  Widget calenderView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          width: 20,
          child: SizedBox(
            width: 20.0,
            height: 20.0,
            child: OutlineButton(
              onPressed: goToPrevious,
              borderSide: BorderSide(
                color: Color(0xFFFAFBFD),
              ),
              color: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              
              padding: EdgeInsets.all(0.0),
              child: Text(
                "<",
                style: TextStyle(
                  fontSize: 22.0,
                  color: Color(0xFFA2C0D4),
                  fontFamily: LocalTheme.Header["title"]["font_family"],
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.topCenter,
          width: 220,
          child: carouselSlider = CarouselSlider(
            height: 50.0,
            initialPage: 0,
            enableInfiniteScroll: false,
            scrollDirection: Axis.horizontal,
            items: [
              'Monday',
              'Tuesday',
              'Wednesday',
              'Thursday',
              'Friday',
              'Saturday'
            ].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(color: Color(0xFFFAFBFD)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Text(
                            '$i',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          width: 20,
          child: SizedBox(
            width: 20.0,
            height: 20.0,
            child: OutlineButton(
              onPressed: goToNext,
              borderSide: BorderSide(
                color: Color(0xFFFAFBFD),
              ),
              color: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              padding: EdgeInsets.all(0.0),
              child: Text(
                ">",
                style: TextStyle(
                  fontSize: 22.0,
                  color: Color(0xFFA2C0D4),
                  fontFamily: LocalTheme.Header["title"]["font_family"],
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  CarouselSlider carouselSlider;

  goToPrevious() {
    carouselSlider.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  goToNext() {
    carouselSlider.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  }

  Widget openalertdialog() {
    return AlertDialog(
      contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      title: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(
          top: 0.0,
          bottom: 15.0,
          left: 0.0,
          right: 0.0,
        ),
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
            ),
          ],
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(
              bottom: 15.0,
            ),
            padding: EdgeInsets.only(
              bottom: 15.0,
            ),
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
                  margin: EdgeInsets.only(
                    left: 20.0,
                  ),
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
            padding: EdgeInsets.only(
              bottom: 15.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: 60,
                  height: 60,
                  padding: EdgeInsets.all(0.0),
                  margin: EdgeInsets.only(
                    left: 20.0,
                  ),
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
}
