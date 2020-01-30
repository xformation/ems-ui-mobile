import 'package:ems/controller/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ems/theme_data.dart';
import 'package:ems/assets/local_icons.dart';

class Menu extends StatelessWidget {
  final List<MenuItem> options = [
    MenuItem(LocalIcons.home, 'Home'),
    MenuItem(LocalIcons.attendance, 'Attendance'),
    MenuItem(LocalIcons.timetable, 'Time Table'),
    MenuItem(LocalIcons.fee_payment, 'Fee Payment'),
    MenuItem(LocalIcons.examination, 'Examinations'),
    MenuItem(LocalIcons.grades, 'Grades'),
    MenuItem(LocalIcons.notification, 'Notifications'),
    MenuItem(LocalIcons.settings, 'Settings'),
    MenuItem(LocalIcons.complaints, 'Complaints'),
    MenuItem(LocalIcons.my_profile, 'My Profile'),
    MenuItem(LocalIcons.logout, 'Logout'),
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
            top: 50,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new UserDetails(
                  "https://celebritypets.net/wp-content/uploads/2016/12/Adriana-Lima.jpg",
                  "Rechard Grand",
                  "Hydrabad, India"),
              Padding(
                padding: EdgeInsets.only(bottom: 33),
              ),
              Divider(
                height: 0,
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(left: 50, top: 23),
                  children: options.map((item) {
                    return MenuItemWidget(
                      icon: item.icon,
                      text: item.title,
                    );
                  }).toList(),
                ),
              ),
            ],
          )),
    );
  }
}

class UserDetails extends StatelessWidget {
  final double _width, _height;
  final String name, description, image;

  UserDetails(this.image, this.name, this.description,
      {double width = 50, double height = 50})
      : _width = width,
        _height = height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: _width,
            height: _height,
            child: new CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(image),
                backgroundColor: Colors.transparent),
          ),
          Text(
            name,
            style: TextStyle(
                color: LocalTheme.menu["user_name"]["color"],
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: LocalTheme.menu["user_name"]["font_family"]),
          ),
          Text(
            description,
            style: TextStyle(
                color: LocalTheme.menu["user_description"]["color"],
                fontSize: 14,
                fontFamily: LocalTheme.menu["user_description"]["font_family"]),
          )
        ],
      ),
    );
  }
}

class MenuItemWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  MenuItemWidget({this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 38,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(icon, color: LocalTheme.menu["item"]["color"], size: 16),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                ),
                Text(
                  text,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: LocalTheme.menu["item"]["color"]),
                )
              ],
            )
          ],
        ));
  }
}

class MenuItem {
  String title;
  IconData icon;

  MenuItem(this.icon, this.title);
}
