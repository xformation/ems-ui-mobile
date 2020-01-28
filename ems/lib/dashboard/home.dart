import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        drawer: new Drawer(
        child: new ListView(
          children: <Widget> [
            new DrawerHeader(
              child: CircleAvatar(
                radius: 30.0,
                backgroundImage:
                    NetworkImage('images/user_male2-512.png'),
                backgroundColor: Colors.transparent,
                child: 
                  Text('Rechard Grand' ,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
                // Text("Hydrabad India",style: TextStyle(fontSize: 15, color: Colors.black))
              ),
              // child: new Text('Header'),
            ),
            new ListTile(
              title: new Text('Home'),
              onTap: () {},
            ),
            new ListTile(
              title: new Text('Attendance'),
              onTap: () {},
            ),
            // new Divider(),
            new ListTile(
              title: new Text('Time Table'),
              onTap: () {},
            ),
            new ListTile(
              title: new Text('Fee Payment'),
              onTap: () {},
            ),
            new ListTile(
              title: new Text('Examinations'),
              onTap: () {},
            ),
            new ListTile(
              title: new Text('Grades'),
              onTap: () {},
            ),
            new ListTile(
              title: new Text('Notifications'),
              onTap: () {},
            ),
            new ListTile(
              title: new Text('settings'),
              onTap: () {},
            ),
             new ListTile(
              title: new Text('Complaints'),
              onTap: () {},
            ),
             new ListTile(
              title: new Text('My Profile'),
              onTap: () {},
            ),
             new ListTile(
              title: new Text('Logout'),
              onTap: () {},
            ),
            
          ],
        )
      ),
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}