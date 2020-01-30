import 'package:ems/containers/parent_container.dart';
import 'package:flutter/material.dart';
import 'package:ems/dashboard/dashboard.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return ParentContainer(Dashboard());
  }
}
