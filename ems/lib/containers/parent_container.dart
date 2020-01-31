import 'package:ems/containers/menu.dart';
import 'package:flutter/material.dart';

class ParentContainer extends StatelessWidget {
  final Widget body;
  ParentContainer(this.body);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(drawer: Menu(), body: body),
    );
  }
}
