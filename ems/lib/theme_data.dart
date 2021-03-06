import 'package:flutter/material.dart';

class LocalTheme {
  LocalTheme._();
  static const Map<String, dynamic> menu = {
    "item": {
      "color": Color(0xFF000000),
      "font_family": "Montserrat",
      "font_weight": FontWeight.w600,
    },
    "user_name": {"color": Color(0xFF292B23), "font_family": "Montserrat"},
    "user_description": {"color": Color(0xFF585954), "font_family": "OpenSans"}
  };

  static const Map<String, dynamic> Header = {
    "title": {
      "title_color": Color(0xFF000000),
      "font_family": "SFProText",
      "fontsize": 17
    },
  };

  static const Map<String, dynamic> timetable = {
    "subject_heading": {
      "color": Color(0xFF3E4237),
      "font_family": "Montserrat",
      "font_weight": FontWeight.w600,
    },
    "sub_heading": {
      "title_color": Color(0xFF3E4237),
      "font_family": "Montserrat",
      "font_weight": FontWeight.w500,
    },
  };

  static const Map<String, dynamic> attendanceCalender = {
    "title": {
      "color": Color(0xFF585954),
      "font_family": "OpenSans",
      "font_weight": FontWeight.w500,
    }
  };

  static const Map<String, dynamic> home = {
    "heading": {
      "color": Color.fromRGBO(41, 43, 35, 1),
      "font_family": "Montserrat",
      "font_weight": FontWeight.w600,
    },
    "student_name": {
      "color": Color(0xFF292B23),
      "font_family": "Montserrat",
      "font_weight": FontWeight.w600,
    },
    "student_description": {
      "color": Color(0xFF585954),
      "font_family": "OpenSans",
    },
    "sub_heading": {
      "color": Color(0xFF292B23),
      "font_family": "Montserrat",
      "font_weight": FontWeight.w600,
    }
  };

  static const Map<String, dynamic> Tab = {
    "heading": {
      "unactive_color": Color(0xFF292B23),
      "active_color": Color(0xFFFDCA40),
      "font_family": "Montserrat",
      "font_weight": FontWeight.w600
    },
  };

  static const Map<String, dynamic> complain = {
    "subHeading": {
      "color": Color(0xFF9C9D9B),
      "font_family": "Montserrat",
    },
  };
}
