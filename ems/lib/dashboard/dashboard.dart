import 'package:flutter/material.dart';
import 'package:ems/theme_data.dart';

class Dashboard {
  Dashboard();
  Widget createdashboard(BuildContext context) {
    return new Container(
        color: Color.fromARGB(1, 250, 250, 248),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
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
              child: ListView(children: <Widget>[
                ListTile(
                  dense: true,
                    title: Text("Select Student",
                        style: TextStyle(
                            color: LocalTheme.dashboard["sub_heading"]["color"],
                            fontWeight: LocalTheme.dashboard["sub_heading"]
                                ["font_weight"],
                            fontFamily: LocalTheme.dashboard["sub_heading"]
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
                          color: LocalTheme.dashboard["student_name"]["color"],
                          fontWeight: LocalTheme.dashboard["student_name"]
                              ["font_weight"],
                          fontFamily: LocalTheme.dashboard["student_name"]
                              ["font_family"],
                          fontSize: 16)),
                  subtitle: Text("8th Grade, Telangana State Boardd",
                      style: TextStyle(
                          color: LocalTheme.dashboard["student_description"]
                              ["color"],
                          fontSize: 12,
                          fontFamily:
                              LocalTheme.dashboard["student_description"]
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
                          color: LocalTheme.dashboard["student_name"]["color"],
                          fontWeight: LocalTheme.dashboard["student_name"]
                              ["font_weight"],
                          fontFamily: LocalTheme.dashboard["student_name"]
                              ["font_family"],
                          fontSize: 16)),
                  subtitle: Text("10th Grade, Telangana State Board",
                      style: TextStyle(
                          color: LocalTheme.dashboard["student_description"]
                              ["color"],
                          fontSize: 12,
                          fontFamily:
                              LocalTheme.dashboard["student_description"]
                                  ["font_family"])),
                ),
              ]),
            ),
            Container(
              height: 220.0,
              margin: EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 0.0, bottom: 20.0),
              color: Colors.white,
              child: ListView(children: <Widget>[
                ListTile(
                   dense: true,
                    title: Text("News and Notifications",
                        style: TextStyle(
                            color: LocalTheme.dashboard["sub_heading"]["color"],
                            fontWeight: LocalTheme.dashboard["sub_heading"]
                                ["font_weight"],
                            fontFamily: LocalTheme.dashboard["sub_heading"]
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
                          color: LocalTheme.dashboard["student_name"]["color"],
                          fontWeight: LocalTheme.dashboard["student_name"]
                              ["font_weight"],
                          fontFamily: LocalTheme.dashboard["student_name"]
                              ["font_family"],
                          fontSize: 16)),
                  subtitle: Text("9:00 am, 26th January, 2020",
                      style: TextStyle(
                          color: LocalTheme.dashboard["student_description"]
                              ["color"],
                          fontSize: 12,
                          fontFamily:
                              LocalTheme.dashboard["student_description"]
                                  ["font_family"])),
                ),
                Divider(),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
                    radius: 30.0,
                  ),
                  title: Text("Annual Day Celebrations",
                      style: TextStyle(
                          color: LocalTheme.dashboard["student_name"]["color"],
                          fontWeight: LocalTheme.dashboard["student_name"]
                              ["font_weight"],
                          fontFamily: LocalTheme.dashboard["student_name"]
                              ["font_family"],
                          fontSize: 16)),
                  subtitle: Text("6:00 pm, 10th February, 2020",
                      style: TextStyle(
                          color: LocalTheme.dashboard["student_description"]
                              ["color"],
                          fontSize: 12,
                          fontFamily:
                              LocalTheme.dashboard["student_description"]
                                  ["font_family"])),
                ),
              ]),
            ),
          ],
        )
        // child: Container(

        // ),
        // child:Container(

        // )
        );
  }
}
