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
              height: 220.0,
              margin: EdgeInsets.all(15.0),
              color: Colors.white,
              child: ListView(children: <Widget>[
                ListTile(
                    title: Text("Select Student",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18))),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
                    radius: 30.0,
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
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
                    radius: 30.0,
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
              margin: EdgeInsets.all(15.0),
              color: Colors.white,
              child: ListView(children: <Widget>[
                ListTile(
                    title: Text("News and Notifications",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18))),
                ListTile(
                  leading: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 44,
                      minHeight: 44,
                      maxWidth: 64,
                      maxHeight: 64,
                    ),
                    child: Image.asset('assets/images/student_image.jpg', fit: BoxFit.cover),
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
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
                    radius: 30.0,
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
          ],
        )
        // child: Container(

        // ),
        // child:Container(

        // )
        );
  }
}
