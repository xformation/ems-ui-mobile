import 'package:flutter/material.dart';
import 'package:ems/theme_data.dart';

class ComplainDetail extends StatefulWidget {
  @override
  _ComplaintDetailState createState() => new _ComplaintDetailState();
}

class _ComplaintDetailState extends State<ComplainDetail> {
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
          padding: EdgeInsets.only(left: 0.0),
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
            "Complaint Details",
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
            child: Row(
              children: <Widget>[
                IconButton(
                  padding: EdgeInsets.only(
                    left: 20.0,
                    right: 15.0,
                  ),
                  icon: Icon(Icons.home),
                  iconSize: 30.0,
                  color: LocalTheme.Header["title"]["title_color"],
                  onPressed: () {
                    Navigator.pushNamed(context, "/");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        color: Color.fromARGB(1, 250, 250, 248),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              studentComplainDetail(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 44,
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
        margin: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          bottom: 20.0,
        ),
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              width: 270,
              padding: EdgeInsets.only(
                  left: 20.0, top: 0.0, bottom: 0.0, right: 0.0),
              margin: EdgeInsets.all(0.0),
              child: TextField(
                obscureText: false,
                style: TextStyle(
                  fontSize: 12.0,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.grey,
                  hintText: "Write Your Feedback",
                ),
              ),
            ),
            Container(
              width: 44,
              height: 44,
              margin: EdgeInsets.only(
                left: 5.0,
                top: 0.0,
                right: 0.0,
                bottom: 0.0,
              ),
              padding: EdgeInsets.all(0.0),
              alignment: Alignment.topRight,
              child: SizedBox(
                height: 44.0,
                width: 44.0,
                child: IconButton(
                  padding: EdgeInsets.all(0.0),
                  icon: Icon(Icons.arrow_right),
                  color: Colors.orange,
                  iconSize: 44,
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget studentComplainDetail() {
    return Container(
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 20,
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
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
              left: 10.0,
              top: 0.0,
              bottom: 0.0,
            ),
            margin: EdgeInsets.only(
              bottom: 15.0,
            ),
            decoration: BoxDecoration(
              color: Color(0xFFFDCA40),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4.0),
                topRight: Radius.circular(4.0),
              ),
            ),
            child: ListTile(
              dense: true,
              title: Text(
                "Details",
                style: TextStyle(
                  color: LocalTheme.home["sub_heading"]["color"],
                  fontWeight: LocalTheme.home["sub_heading"]["font_weight"],
                  fontFamily: LocalTheme.home["sub_heading"]["font_family"],
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
              left: 27,
              right: 27,
              bottom: 12.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  width: 100,
                  padding: EdgeInsets.all(0.0),
                  margin: EdgeInsets.all(0.0),
                  child: Text(
                    "Name",
                    style: TextStyle(
                      color: LocalTheme.complain["subHeading"]["color"],
                      fontFamily: LocalTheme.complain["subHeading"]
                          ["font_family"],
                      fontSize: 12,
                      height: 1.5,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(0.0),
                  margin: EdgeInsets.all(0.0),
                  child: Text(
                    "School bus is always late",
                    style: TextStyle(
                      color: LocalTheme.home["student_name"]["color"],
                      fontFamily: LocalTheme.home["student_name"]
                          ["font_family"],
                      fontSize: 12,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
              left: 27,
              right: 27,
              bottom: 12.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  width: 100,
                  padding: EdgeInsets.all(0.0),
                  margin: EdgeInsets.all(0.0),
                  child: Text(
                    "Date",
                    style: TextStyle(
                      color: LocalTheme.complain["subHeading"]["color"],
                      fontFamily: LocalTheme.complain["subHeading"]
                          ["font_family"],
                      fontSize: 12,
                      height: 1.5,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(0.0),
                  margin: EdgeInsets.all(0.0),
                  width: 150,
                  child: Text(
                    "26 Feb 2020.",
                    style: TextStyle(
                      color: LocalTheme.home["student_name"]["color"],
                      fontFamily: LocalTheme.home["student_name"]
                          ["font_family"],
                      fontSize: 12,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
              left: 27,
              right: 27,
              bottom: 12.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  width: 100,
                  padding: EdgeInsets.all(0.0),
                  margin: EdgeInsets.all(0.0),
                  child: Text(
                    "Category",
                    style: TextStyle(
                      color: LocalTheme.complain["subHeading"]["color"],
                      fontFamily: LocalTheme.complain["subHeading"]
                          ["font_family"],
                      fontSize: 12,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(0.0),
                  margin: EdgeInsets.all(0.0),
                  width: 150,
                  child: Text(
                    "School Bus",
                    style: TextStyle(
                      color: LocalTheme.home["student_name"]["color"],
                      fontFamily: LocalTheme.home["student_name"]
                          ["font_family"],
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
              left: 27,
              right: 27,
              bottom: 12.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  width: 100,
                  padding: EdgeInsets.all(0.0),
                  margin: EdgeInsets.all(0.0),
                  child: Text(
                    "Subject",
                    style: TextStyle(
                        color: LocalTheme.complain["subHeading"]["color"],
                        fontFamily: LocalTheme.complain["subHeading"]
                            ["font_family"],
                        fontSize: 12,
                        height: 1.5),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(0.0),
                  margin: EdgeInsets.all(0.0),
                  width: 150,
                  child: Text(
                    "School Bus Late",
                    style: TextStyle(
                        color: LocalTheme.home["student_name"]["color"],
                        fontFamily: LocalTheme.home["student_name"]
                            ["font_family"],
                        fontSize: 12,
                        height: 1.5),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
              left: 27,
              right: 27,
              bottom: 12.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  width: 100,
                  padding: EdgeInsets.all(0.0),
                  margin: EdgeInsets.all(0.0),
                  child: Text(
                    "Complaint",
                    style: TextStyle(
                      color: LocalTheme.complain["subHeading"]["color"],
                      fontFamily: LocalTheme.complain["subHeading"]
                          ["font_family"],
                      fontSize: 12,
                      height: 1.5,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(0.0),
                  margin: EdgeInsets.all(0.0),
                  width: 150,
                  child: Text(
                    "Hi Sir, \nSchool bus is always late, please look in to this matter.",
                    style: TextStyle(
                      color: LocalTheme.home["student_name"]["color"],
                      fontFamily: LocalTheme.home["student_name"]
                          ["font_family"],
                      fontSize: 12,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
              left: 27,
              right: 27,
              bottom: 25.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  width: 100,
                  padding: EdgeInsets.all(0.0),
                  margin: EdgeInsets.all(0.0),
                  child: Text(
                    "Status",
                    style: TextStyle(
                      color: LocalTheme.complain["subHeading"]["color"],
                      fontFamily: LocalTheme.complain["subHeading"]
                          ["font_family"],
                      fontSize: 12,
                      height: 1.5,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(0.0),
                  margin: EdgeInsets.all(0.0),
                  width: 150,
                  child: Text(
                    "Open",
                    style: TextStyle(
                      color: Color(0xFF7ED321),
                      fontFamily: LocalTheme.home["student_name"]
                          ["font_family"],
                      fontSize: 12,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
