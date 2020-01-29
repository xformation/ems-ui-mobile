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
          padding: EdgeInsets.only(
              top: 62,
              left: 32,
              bottom: 8,
              right: MediaQuery.of(context).size.width / 2.9),
          color: Color(0xff454dff),
          child: Column(
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
              Spacer(),
              Column(
                children: options.map((item) {
                  return ListTile(
                    leading: Icon(
                      item.icon,
                      color: Colors.white,
                      size: 20,
                    ),
                    title: Text(
                      item.title,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
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
