import 'package:ems/containers/menu.dart';
import 'package:ems/containers/slide_scaffold.dart';
import 'package:ems/controller/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ParentContainer extends StatefulWidget {
  final Widget body;
  ParentContainer(this.body);
  @override
  _ParentContainerState createState() => new _ParentContainerState(body);
}

class _ParentContainerState extends State<ParentContainer>
    with TickerProviderStateMixin {
  MenuController _menuController;
  final Widget body;
  _ParentContainerState(this.body);

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
    return ChangeNotifierProvider(
        builder: (context) => _menuController,
        child: SlideScaffold(
            menuScreen: Menu(),
            contentBuilder: (cc) => Container(
                  //  padding: EdgeInsets.all(16.0),
                  child: body,
                )));
  }
}
