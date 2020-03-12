import 'package:flutter/material.dart';
import 'package:ems/theme_data.dart';

class Complaints extends StatefulWidget {
  @override
  _ComplaintState createState() => new _ComplaintState();
}

class _ComplaintState extends State<Complaints> {
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
          padding:
              EdgeInsets.only(top: 5.0, right: 0.0, bottom: 0.0, left: 0.0),
          child: Text(
            "Complaints",
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
              // padding: EdgeInsets.only(right: 20.0),
              child: Row(children: <Widget>[
                GestureDetector(
                  child: Image.asset(
                    'assets/images/Student.png',
                    fit: BoxFit.cover,
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      child: openalertdialog(),
                    );
                  },
                ),
                IconButton(
                  padding: EdgeInsets.only(left: 20.0, right: 10.0),
                  icon: Icon(Icons.home),
                  iconSize: 32.0,
                  color: LocalTheme.Header["title"]["title_color"],
                  onPressed: () {
                    Navigator.pushNamed(context, "/");
                  },
                ),
              ])),
        ],
      ),
      body: Container(
        color: Color.fromARGB(1, 250, 250, 248),
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            studentprofileDetail(),
            studentComplain(),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { 
          Navigator.pushNamed(context, "/Registercomplain");
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  Widget openalertdialog() {
    return AlertDialog(
      contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      title: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(
          top: 0.0,
          bottom: 15.0,
          left: 0.0,
          right: 0.0,
        ),
        margin: EdgeInsets.all(0.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              width: 205,
              padding: EdgeInsets.all(0.0),
              margin: EdgeInsets.all(0.0),
              child: Text(
                "Select Student",
                style: TextStyle(
                  color: LocalTheme.home["sub_heading"]["color"],
                  fontWeight: LocalTheme.home["sub_heading"]["font_weight"],
                  fontFamily: LocalTheme.home["sub_heading"]["font_family"],
                  fontSize: 14,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              width: 24,
              height: 24,
              padding: EdgeInsets.all(0.0),
              margin: EdgeInsets.all(0.0),
              child: IconButton(
                alignment: Alignment.topRight,
                padding: EdgeInsets.all(0.0),
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(
              bottom: 15.0,
            ),
            padding: EdgeInsets.only(
              bottom: 15.0,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1.0,
                  color: Color(0xFFFFE0E5D4),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  width: 60,
                  height: 60,
                  padding: EdgeInsets.all(0.0),
                  margin: EdgeInsets.only(
                    left: 20.0,
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
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(0.0),
                  margin: EdgeInsets.all(0.0),
                  width: 200,
                  child: ListTile(
                    title: Text(
                      "Sara Adamas",
                      style: TextStyle(
                        color: LocalTheme.home["student_name"]["color"],
                        fontWeight: LocalTheme.home["student_name"]
                            ["font_weight"],
                        fontFamily: LocalTheme.home["student_name"]
                            ["font_family"],
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
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
              bottom: 15.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: 60,
                  height: 60,
                  padding: EdgeInsets.all(0.0),
                  margin: EdgeInsets.only(
                    left: 20.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: Color(0xffE0E5D4),
                      width: 1,
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/Image2.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(0.0),
                  margin: EdgeInsets.all(0.0),
                  width: 200,
                  child: ListTile(
                    title: Text(
                      "Kevin Dean",
                      style: TextStyle(
                          color: LocalTheme.home["student_name"]["color"],
                          fontWeight: LocalTheme.home["student_name"]
                              ["font_weight"],
                          fontFamily: LocalTheme.home["student_name"]
                              ["font_family"],
                          fontSize: 16),
                    ),
                    subtitle: Text(
                      "10th Grade, Telangana State Board",
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
          ),
        ],
      ),
    );
  }

  Widget studentprofileDetail() {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
      padding: EdgeInsets.only(top: 15.0, left: 0.0, right: 0.0, bottom: 5.0),
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
            margin: EdgeInsets.only(left: 20.0, right: 5.0),
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

  Widget studentComplain() {
    return Container(
      height: 270,
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
          // mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              // alignment: Alignment.topLeft,
              height: 40,
              padding: EdgeInsets.only(left: 25.0, top: 0.0, bottom: 7.0),
              color: Color(0xFFFDCA40),
              child: ListTile(
                dense: true,
                title: Text(
                  "Richard Grand",
                  style: TextStyle(
                      color: LocalTheme.home["sub_heading"]["color"],
                      fontWeight: LocalTheme.home["sub_heading"]["font_weight"],
                      fontFamily: LocalTheme.home["sub_heading"]["font_family"],
                      fontSize: 14),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 25, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 100,
                    height: 60,
                    padding: EdgeInsets.all(0.0),
                    margin: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Subject",
                      style: TextStyle(
                        color: LocalTheme.complain["subHeading"]["color"],
                        fontFamily: LocalTheme.complain["subHeading"]
                            ["font_family"],
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(0.0),
                    margin: EdgeInsets.all(0.0),
                    // width: 220,
                    child: Text(
                      "School bus is always late",
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
              padding: EdgeInsets.only(left: 25, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 100,
                    height: 60,
                    padding: EdgeInsets.all(0.0),
                    margin: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Complaint",
                      style: TextStyle(
                        color: LocalTheme.complain["subHeading"]["color"],
                        fontFamily: LocalTheme.complain["subHeading"]
                            ["font_family"],
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(0.0),
                    margin: EdgeInsets.all(0.0),
                    width: 150,
                    child: Text(
                      "Hi Sir, School bus is always late, please look in to this matter.",
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
              padding: EdgeInsets.only(left: 25, right: 20),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1.0,
                    color: Color(0xFFFFE0E5D4),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 100,
                    height: 60,
                    padding: EdgeInsets.all(0.0),
                    margin: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Date",
                      style: TextStyle(
                        color: LocalTheme.complain["subHeading"]["color"],
                        fontFamily: LocalTheme.complain["subHeading"]
                            ["font_family"],
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(0.0),
                    margin: EdgeInsets.all(0.0),
                    width: 150,
                    child: Text(
                      "26 Feb 2020",
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
              // alignment: Alignment.topLeft,
              // padding: EdgeInsets.only(left: 25, right: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      width: 120,
                      // height: 60,
                      padding: EdgeInsets.all(0.0),
                      margin: EdgeInsets.only(left: 20.0),
                      child: FlatButton(
                        textColor: Color(0xFF7ED321),
                        color: Colors.white,
                        onPressed: () {},
                        child:
                            const Text('OPEN', style: TextStyle(fontSize: 14)),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(0.0),
                      margin: EdgeInsets.all(0.0),
                      // width: 150,
                      child: FlatButton(
                        textColor: Colors.black,
                        color: Colors.white,
                        onPressed: () {},
                        child: const Text(
                          'Close',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    Container(
                      // alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(0.0),
                      margin: EdgeInsets.all(0.0),
                      // width: 150,
                      child: FlatButton(
                        textColor: Colors.black,
                        color: Colors.white,
                        onPressed: () {},
                        child: const Text(
                          'View',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ]),
            ),
          ]),
    );
  }
}
