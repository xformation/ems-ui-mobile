import 'package:flutter/material.dart';

class LocalTheme {
  LocalTheme._();
  static const Map<String, dynamic> menu = {
    "item": {
      "color": Color(0xFF6C8A26),
      "font_family": "Montserrat" 
    },
    "user_name": {
      "color": Color(0xFF292B23),
      "font_family": "Montserrat" 
    },
    "user_description": {
      "color": Color(0xFF585954),
      "font_family": "OpenSans"
    }
  };

   static const Map<String, dynamic> dashboard = {
    "student_name": {
      "color": Color.fromRGBO(41, 43, 35, 1),
      "font_family": "Montserrat" ,
      "font_weight": FontWeight.bold,
    },
    "student_description": {
      "color": Color.fromRGBO(88, 89, 84, 1),
      "font_family": "OpenSans",
    }
  };

}