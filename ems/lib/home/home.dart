import 'package:ems/containers/menu.dart';
import 'package:ems/containers/slide_scaffold.dart';
import 'package:ems/controller/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return ChangeNotifierProvider(
        builder: (context) => _menuController,
        child: SlideScaffold(
            menuScreen: Menu(),
            contentBuilder: (cc) => Container(
                  color: Colors.grey[200],
                  child: Container(
                      height: 200.0,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Column(children: [
                              Text("Select Student")
                            ]),
                          )
                        ],
                      )),
                )));
  }
}

//  child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
//           Expanded(
//             child: Column(children: [
//               Container(height: 120.0, color: Colors.yellow),
//               Container(height: 100.0, color: Colors.cyan),
//             ]),
//           ),
//           Expanded(child: Container(color: Colors.amber)),
//         ]),
