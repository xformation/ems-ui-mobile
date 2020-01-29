import 'package:flutter/cupertino.dart';

enum MenuState { closed, open, opening, closing }

class MenuController extends ChangeNotifier {
  final TickerProvider vsync;
  final AnimationController _animationController;
  MenuState _menuState = MenuState.closed;

  MenuController({this.vsync})
      : _animationController = AnimationController(vsync: vsync) {
    _animationController
      ..duration = const Duration(milliseconds: 200)
      ..addListener(() {
        notifyListeners();
      })
      ..addStatusListener((AnimationStatus status) {
        switch (status) {
          case AnimationStatus.forward:
            _menuState = MenuState.opening;
            break;
          case AnimationStatus.reverse:
            _menuState = MenuState.closing;
            break;
          case AnimationStatus.completed:
            _menuState = MenuState.open;
            break;
          case AnimationStatus.dismissed:
            _menuState = MenuState.closed;
            break;
        }
        notifyListeners();
      });
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  MenuState get menuState {
    return _menuState;
  }

  double get percentOpen {
    return _animationController.value;
  }

  open() {
    _animationController.forward();
  }

  close() {
    _animationController.reverse();
  }

  toggle() {
    if (_menuState == MenuState.open) {
      close();
    } else if (_menuState == MenuState.closed) {
      open();
    }
  }
}
