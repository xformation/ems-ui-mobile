import 'package:flutter/material.dart';
import 'package:ems/theme_data.dart';
import 'package:ems/assets/local_icons.dart';

class Menu extends StatelessWidget {
  final List<MenuItem> options = [
    MenuItem(LocalIcons.home, 'Home', "/"),
    MenuItem(LocalIcons.attendance, 'Attendance', "/"),
    MenuItem(LocalIcons.timetable, 'Time Table', "/timetable"),
    MenuItem(LocalIcons.fee_payment, 'Fee Payment', "/"),
    MenuItem(LocalIcons.examination, 'Examinations', "/"),
    //MenuItem(LocalIcons.grades, 'Grades', "/graph"),
    MenuItem(LocalIcons.notification, 'Notifications', "/"),
    MenuItem(LocalIcons.settings, 'Settings', "/"),
    MenuItem(LocalIcons.complaints, 'Complaints', "/"),
    MenuItem(LocalIcons.my_profile, 'My Profile', "/"),
    MenuItem(LocalIcons.logout, 'Logout', "/"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 278,
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
                  padding: EdgeInsets.only(top: 23),
                  children: options.map((item) {
                    return MenuItemWidget(item);
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
  final MenuItem item;

  MenuItemWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: () {
              // Provider.of<MenuController>(context, listen: true).close();
              Navigator.pop(context);
              // Navigator.popAndPushNamed(context, item.route);
              Navigator.pushNamed(context, item.route);
            },
            child: Container(
                height: 38,
                padding: EdgeInsets.only(left: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(item.icon,
                            color: LocalTheme.menu["item"]["color"], size: 16),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                        ),
                        Text(
                          item.title,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: LocalTheme.menu["item"]["font_weight"],
                              color: LocalTheme.menu["item"]["color"],
                              fontFamily: LocalTheme.menu["item"]["font_family"]),
                        )
                      ],
                    )
                  ],
                ))));
  }
}

class MenuItem {
  String title;
  IconData icon;
  String route;

  MenuItem(this.icon, this.title, this.route);
}
