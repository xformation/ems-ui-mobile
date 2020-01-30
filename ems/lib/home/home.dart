import 'package:ems/containers/menu.dart';
import 'package:ems/containers/slide_scaffold.dart';
import 'package:ems/controller/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ems/dashboard/dashboard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  MenuController _menuController;

  @override
  void initState() {
    super.initState();
    _menuController = new MenuController(vsync: this);
    _menuController.addListener(() {
      return setState(() {});
    });
  }

  @override
  void dispose() {
    _menuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dashboard = Dashboard();
    return ChangeNotifierProvider(
        builder: (context) => _menuController,
        child: SlideScaffold(
            menuScreen: Menu(),
            contentBuilder: (cc) => Container(
                  //  padding: EdgeInsets.all(16.0),
                  child: dashboard.createdashboard(context),
                )));
  }
}
