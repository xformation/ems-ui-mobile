import 'package:ems/controller/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Menu extends StatelessWidget {
  final List<MenuItem> options = [
    MenuItem(Icons.account_balance, 'Home', Colors.black38),
    MenuItem(Icons.account_circle, 'Attendance', Colors.black38),
    MenuItem(Icons.calendar_today, 'Time Table', Colors.black38),
    MenuItem(Icons.payment, 'Fee Payment', Colors.black38),
    MenuItem(Icons.account_balance, 'Examinations', Colors.black38),
    MenuItem(Icons.grade, 'Grades', Colors.black38),
    MenuItem(Icons.notifications, 'Notifications', Colors.black38),
    MenuItem(Icons.settings, 'Settings', Colors.black38),
    MenuItem(Icons.feedback, 'Complaints', Colors.black38),
    MenuItem(Icons.account_circle, 'My Profile', Colors.black38),
    MenuItem(Icons.clear_all, 'Logout', Colors.black38),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dx < -6) {
          Provider.of<MenuController>(context, listen: true).toggle();
        }
      },
      child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(
              top: 10,
              // left: 32,
              // bottom: 8,
              right: MediaQuery.of(context).size.width / 2.9),
          child: Column(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                margin: EdgeInsets.only(left: 15, bottom: 0.0),
                decoration: BoxDecoration(color: Colors.white
                    // color: const Color(0xFF00897b),
                    ),
                accountName: new Text("Rechard Grand",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                accountEmail: new Text("Hydrabad, India",
                    style: TextStyle(fontSize: 10, color: Colors.black)),
                currentAccountPicture: new CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
                    backgroundColor: Colors.transparent),
              ),
              Divider(),
              // Spacer(),
              Column(
                children: options.map((item) {
                  return ListTile(
                    leading: Icon(
                      item.icon,
                      color: Colors.green[300],
                      size: 20,
                    ),
                    title: Text(
                      item.title,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[300]),
                    ),
                  );
                }).toList(),
              ),
              Spacer(),
            ],
          )),
    );
  }
}

class MenuItem {
  String title;
  IconData icon;
  Color color;

  MenuItem(this.icon, this.title, this.color);
}
