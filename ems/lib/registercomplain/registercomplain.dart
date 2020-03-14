import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ems/theme_data.dart';

class Registercomplain extends StatefulWidget {
  @override
  _RegisterComplainState createState() => new _RegisterComplainState();
}

class _RegisterComplainState extends State<Registercomplain> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(1, 250, 250, 248),
        elevation: 0.0,
        leading: Container(
          alignment: Alignment.centerLeft,
          width: 30.0,
          padding: EdgeInsets.only(
            left: 0.0,
          ),
          child: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: LocalTheme.home["heading"]["color"],
              size: 40,
            ),
            iconSize: 24.0,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Container(
          alignment: Alignment(-1.4, 0.0),
          padding: EdgeInsets.only(
            top: 5.0,
            right: 0.0,
            bottom: 0.0,
            left: 0.0,
          ),
          child: Text(
            "Register Complaint",
            style: TextStyle(
              color: LocalTheme.Header["title"]["title_color"],
              fontFamily: LocalTheme.Header["title"]["font_family"],
              fontSize: 17,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        actions: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            child: Row(children: <Widget>[
              IconButton(
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                icon: Icon(Icons.check),
                iconSize: 30.0,
                color: LocalTheme.Header["title"]["title_color"],
                onPressed: () {
                  Navigator.pushNamed(context, "/");
                },
              ),
            ]),
          ),
        ],
      ),
      body: Container(
        color: Color.fromARGB(1, 250, 250, 248),
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            studentprofileDetail(),
            complainForm(),
          ]),
        ),
      ),
    );
  }

  Widget studentprofileDetail() {
    return Container(
      margin: EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 20.0,
        bottom: 20.0,
      ),
      padding: EdgeInsets.only(
        top: 15.0,
        left: 0.0,
        right: 0.0,
        bottom: 5.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8.0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            width: 60,
            height: 60,
            padding: EdgeInsets.all(0.0),
            margin: EdgeInsets.only(
              left: 20.0,
              right: 5.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: Color(0xffE0E5D4),
                width: 1,
              ),
            ),
            child: Image.asset(
              'assets/images/Image.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(0.0),
            margin: EdgeInsets.all(0.0),
            width: 220,
            child: ListTile(
              title: Text(
                "Sara Adamas",
                style: TextStyle(
                  color: LocalTheme.home["student_name"]["color"],
                  fontWeight: LocalTheme.home["student_name"]["font_weight"],
                  fontFamily: LocalTheme.home["student_name"]["font_family"],
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                "8th Grade, Telangana State Board",
                style: TextStyle(
                  color: LocalTheme.home["student_description"]["color"],
                  fontSize: 12,
                  fontFamily: LocalTheme.home["student_description"]
                      ["font_family"],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _dropdownValue = 'Academic';
  Widget complainForm() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 20,
      ),
      padding: EdgeInsets.only(
        top: 20.0,
        bottom: 20.0,
        right: 20.0,
        left: 20.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8.0,
          ),
        ],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
          Widget>[
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
            left: 0.0,
            top: 0.0,
            bottom: 7.0,
            right: 0.0,
          ),
          child: Text(
            "Complaint Type",
            style: TextStyle(
              color: LocalTheme.timetable["sub_heading"]["color"],
              fontFamily: LocalTheme.timetable["sub_heading"]["font_family"],
              fontWeight: LocalTheme.timetable["sub_heading"]["font_weight"],
              fontSize: 14,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: 0.0,
            top: 0.0,
            bottom: 0.0,
            right: 0.0,
          ),
          padding: EdgeInsets.only(
            top: 3.0,
            bottom: 3.0,
            left: 10.0,
            right: 5.0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(3),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
              ),
            ],
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.white,
            ),
            child: DropdownButton<String>(
              isDense: true,
              elevation: 5,
              iconEnabledColor: Color(0xFF292B23),
              underline: Text(''),
              value: _dropdownValue,
              style: TextStyle(
                color: Color(0xFF292B23),
                decorationColor: Color(0xFFFDCA40),
                fontSize: 14.0,
              ),
              isExpanded: true,
              items: <String>[
                'Academic',
                'Canteen',
                'School Bus',
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _dropdownValue = value;
                });
              },
            ),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
            left: 0.0,
            top: 12.0,
            bottom: 7.0,
          ),
          child: Text(
            "Subject",
            style: TextStyle(
              color: LocalTheme.timetable["sub_heading"]["color"],
              fontWeight: LocalTheme.timetable["sub_heading"]["font_weight"],
              fontFamily: LocalTheme.timetable["sub_heading"]["font_family"],
              fontSize: 14,
            ),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          height: 30,
          padding: EdgeInsets.only(
            left: 0.0,
            top: 0.0,
            bottom: 0.0,
            right: 0.0,
          ),
          child: TextField(
            obscureText: false,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 5.0),
              hintText: "",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3.0),
                borderSide: BorderSide(color: Colors.grey[350]),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
            left: 0.0,
            top: 12.0,
            bottom: 7.0,
          ),
          child: Text(
            "Message",
            style: TextStyle(
              color: LocalTheme.timetable["sub_heading"]["color"],
              fontWeight: LocalTheme.timetable["sub_heading"]["font_weight"],
              fontFamily: LocalTheme.timetable["sub_heading"]["font_family"],
              fontSize: 14,
            ),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          height: 80,
          decoration: BoxDecoration(
            color: Color(0xFFF3F3F3),
            borderRadius: BorderRadius.circular(3),
          ),
          margin: EdgeInsets.only(
            left: 0.0,
            top: 0.0,
            bottom: 0.0,
            right: 0.0,
          ),
          padding: EdgeInsets.only(
            top: 5.0,
            bottom: 5.0,
            left: 10.0,
            right: 10.0,
          ),
          child: TextField(
            maxLines: 8,
            decoration: InputDecoration.collapsed(
              hintText: "",
            ),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(
            left: 0.0,
            top: 20.0,
            bottom: 0.0,
            right: 0.0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(const Radius.circular(8.0)),
          ),
          child: SizedBox(
            height: 36,
            width: 320,
            child: RaisedButton(
              padding: EdgeInsets.only(
                top: 10.0,
                bottom: 10.0,
              ),
              textColor: Colors.black,
              color: Color(0xFFFDCA40),
              onPressed: () {},
              child: Text(
                'Submit',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: LocalTheme.home["sub_heading"]["font_weight"],
                  fontFamily: LocalTheme.home["sub_heading"]["font_family"],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
