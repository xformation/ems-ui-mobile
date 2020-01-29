import 'package:flutter/material.dart';

class SideMenu{
  SideMenu();
  Widget createSideMenu(BuildContext context){
    return new Drawer(
          child: new ListView(
          padding: const EdgeInsets.all(0.0),
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Rechard Grand",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              accountEmail: new Text("Hydrabad, India",
                  style: TextStyle(fontSize: 15, color: Colors.black)),
              currentAccountPicture: new CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
                  backgroundColor: Colors.transparent),
            ),
            new ListTile(
              // dense:true,
              // contentPadding: EdgeInsets.only(bottom: 0.0),
              leading: Icon(Icons.account_balance, color: Colors.black38),
              title: new Text('Home'),
              onTap: () {},
            ),
            new ListTile(
              leading: Icon(Icons.account_circle, color: Colors.black38),
              title: new Text('Attendance'),
              onTap: () {
                Navigator.of(context).pop();
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (BuildContext context) =>
                //             MarkAttendancePage(store)));
              },
            ),
            // new Divider(),
            new ListTile(
              leading: Icon(Icons.calendar_today, color: Colors.black38),
              title: new Text('Time Table'),
              onTap: () {},
            ),
            new ListTile(
              leading: Icon(Icons.payment, color: Colors.black38),
              title: new Text('Fee Payment'),
              onTap: () {},
            ),
            new ListTile(
              leading: Icon(Icons.account_balance, color: Colors.black38),
              title: new Text('Examinations'),
              onTap: () {},
            ),
            new ListTile(
              leading: Icon(Icons.grade, color: Colors.black38),
              title: new Text('Grades'),
              onTap: () {},
            ),
            new ListTile(
              leading: Icon(Icons.notifications, color: Colors.black38),
              title: new Text('Notifications'),
              onTap: () {},
            ),
            new ListTile(
              leading: Icon(Icons.settings, color: Colors.black38),
              title: new Text('settings'),
              onTap: () {},
            ),
            new ListTile(
              leading: Icon(Icons.feedback, color: Colors.black38),
              title: new Text('Complaints'),
              onTap: () {},
            ),
            new ListTile(
              leading: Icon(Icons.account_circle, color: Colors.black38),
              title: new Text('My Profile'),
              onTap: () {},
            ),
            new ListTile(
              leading: Icon(Icons.clear_all, color: Colors.black38),
              title: new Text('Logout'),
              onTap: () {},
            ),
          ],
        ));
  }
}