import 'package:flutter/material.dart';
import 'package:ems/theme_data.dart';

class SubjectAttendance extends StatefulWidget {
  @override
  _SubjectAttendanceState createState() => new _SubjectAttendanceState();
}

class _SubjectAttendanceState extends State<SubjectAttendance> {
  @override
  void initState() {
    super.initState();
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
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        body: Container(
            color: Color.fromARGB(1, 250, 250, 248),
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
              studentprofileDetail(),
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
}