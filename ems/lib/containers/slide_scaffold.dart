import 'package:ems/controller/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideScaffold extends StatefulWidget {
  final Widget menuScreen;
  final WidgetBuilder contentBuilder;
  SlideScaffold({this.menuScreen, this.contentBuilder});
  @override
  _SlideScaffoldState createState() => _SlideScaffoldState();
}

class _SlideScaffoldState extends State<SlideScaffold>
    with TickerProviderStateMixin {
  Curve slideInCurve = Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideOutCurve = Interval(0.0, 1.0, curve: Curves.easeOut);

  createContentDisplay() {
    return slideContent(
        Container(child: Scaffold(body: widget.contentBuilder(context))));
  }

  slideContent(Widget content) {
    double slidePercent;
    double percentOpen =
        Provider.of<MenuController>(context, listen: true).percentOpen;
    switch (Provider.of<MenuController>(context, listen: true).menuState) {
      case MenuState.closed:
        slidePercent = 0.0;
        break;
      case MenuState.open:
        slidePercent = 1.0;
        break;
      case MenuState.closing:
        slidePercent = slideInCurve.transform(percentOpen);
        break;
      case MenuState.opening:
        slidePercent = slideOutCurve.transform(percentOpen);
        break;
    }
    final slideAmount = 250.0 * slidePercent;
    return Transform(
      transform: Matrix4.translationValues(slideAmount, 0.0, 0.0),
      alignment: Alignment.centerLeft,
      child: Container(
        child: content,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
          child: AnimatedOpacity(
            opacity:
                Provider.of<MenuController>(context, listen: true).menuState ==
                        MenuState.open
                    ? 1
                    : 0,
            duration: Duration(milliseconds: 200),
            child: Visibility(
              visible: Provider.of<MenuController>(context, listen: true)
                      .menuState !=
                  MenuState.closed,
              child: Scaffold(
                body: widget.menuScreen,
              ),
            ),
          ),
        ),
        createContentDisplay()
      ],
    );
  }
}
