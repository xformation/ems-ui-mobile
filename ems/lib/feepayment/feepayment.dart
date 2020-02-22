import 'package:flutter/material.dart';
import 'package:ems/theme_data.dart';

class FeePayment extends StatefulWidget {
  @override
  _FeePaymentState createState() => new _FeePaymentState();
}

class _FeePaymentState extends State<FeePayment> with TickerProviderStateMixin {
  TabController _tabController;
  bool _paymentHistory = false;
  bool _feepayment = true;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(_handleTabChange);
  }

  _handleTabChange() {
    if (_tabController.indexIsChanging) {
      setState(() {
        if (_tabController.index == 0) {
          _feepayment = true;
          _paymentHistory = false;
        } else if (_tabController.index == 1) {
          _paymentHistory = true;
          _feepayment = false;
        }
      });
    }
  }

  String _dropdownValue = 'Semester - I';
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
              "Fee Payment",
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
              feepaymentTabOptions(),
            ]),
          ),
        ));
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

  Widget feepaymentTabOptions() {
    return Container(
      margin: EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 0.0,
        bottom: 20.0,
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
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.yellow[300],
              unselectedLabelColor: LocalTheme.Tab["heading"]["unactive_color"],
              labelColor: LocalTheme.Tab["heading"]["active_color"],
              tabs: <Widget>[
                Tab(
                  child: Text(
                    "Fee Payment",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: LocalTheme.Tab["heading"]["font_family"],
                      fontWeight: LocalTheme.Tab["heading"]["font_weight"],
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Payment History",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: LocalTheme.Tab["heading"]["font_family"],
                      fontWeight: LocalTheme.Tab["heading"]["font_weight"],
                    ),
                  ),
                )
              ],
            ),
          ),
          Visibility(
            visible: _feepayment,
            child: Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                top: 30.0,
                bottom: 10.0,
                left: 24.0,
                right: 24.0,
              ),
              padding: EdgeInsets.only(
                top: 10.0,
                bottom: 5.0,
                left: 15.0,
                right: 15.0,
              ),
              decoration: BoxDecoration(
                color: Color(0xFFFDCA40),
              ),
              child: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Color(0xFFFDCA40),
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
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  isExpanded: true,
                  items: <String>[
                    'Semester - I',
                    'Semester - II',
                    'Semester - III',
                    'Semester - IV'
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
          ),
          Visibility(
              visible: _feepayment,
              child: Container(
                color: Colors.white,
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(
                  top: 20.0,
                  right: 30.0,
                  bottom: 10.0,
                  left: 30.0,
                ),
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(
                            top: 0.0,
                            right: 0.0,
                            bottom: 2.0,
                            left: 0.0,
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 160,
                                height: 25,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(
                                  top: 0.0,
                                  right: 0.0,
                                  bottom: 0.0,
                                  left: 18.0,
                                ),
                                child: Text(
                                  "Invoice ID",
                                  style: TextStyle(
                                    color: LocalTheme.home["student_name"]
                                        ["color"],
                                    fontWeight: LocalTheme.home["student_name"]
                                        ["font_weight"],
                                    fontFamily: LocalTheme.home["student_name"]
                                        ["font_family"],
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 25,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(
                                  top: 0.0,
                                  right: 0.0,
                                  bottom: 0.0,
                                  left: 13.0,
                                ),
                                child: Text(
                                  "2485",
                                  style: TextStyle(
                                    color: LocalTheme.home["student_name"]
                                        ["color"],
                                    fontWeight: LocalTheme.home["student_name"]
                                        ["font_weight"],
                                    fontFamily: LocalTheme.home["student_name"]
                                        ["font_family"],
                                    fontSize: 12,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(
                            top: 0.0,
                            right: 0.0,
                            bottom: 2.0,
                            left: 0.0,
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 160,
                                height: 25,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(
                                  top: 0.0,
                                  right: 0.0,
                                  bottom: 0.0,
                                  left: 18.0,
                                ),
                                child: Text(
                                  "Recipient",
                                  style: TextStyle(
                                    color: LocalTheme.home["student_name"]
                                        ["color"],
                                    fontWeight: LocalTheme.home["student_name"]
                                        ["font_weight"],
                                    fontFamily: LocalTheme.home["student_name"]
                                        ["font_family"],
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 25,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(
                                  top: 0.0,
                                  right: 0.0,
                                  bottom: 0.0,
                                  left: 13.0,
                                ),
                                child: Text(
                                  "Sara Adams",
                                  style: TextStyle(
                                    color: LocalTheme.home["student_name"]
                                        ["color"],
                                    fontWeight: LocalTheme.home["student_name"]
                                        ["font_weight"],
                                    fontFamily: LocalTheme.home["student_name"]
                                        ["font_family"],
                                    fontSize: 12,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(
                            top: 0.0,
                            right: 0.0,
                            bottom: 2.0,
                            left: 0.0,
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 160,
                                height: 25,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(
                                  top: 0.0,
                                  right: 0.0,
                                  bottom: 0.0,
                                  left: 18.0,
                                ),
                                child: Text(
                                  "Fee Category",
                                  style: TextStyle(
                                    color: LocalTheme.home["student_name"]
                                        ["color"],
                                    fontWeight: LocalTheme.home["student_name"]
                                        ["font_weight"],
                                    fontFamily: LocalTheme.home["student_name"]
                                        ["font_family"],
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 25,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(
                                  top: 0.0,
                                  right: 0.0,
                                  bottom: 0.0,
                                  left: 13.0,
                                ),
                                child: Text(
                                  "Semester Fee",
                                  style: TextStyle(
                                    color: LocalTheme.home["student_name"]
                                        ["color"],
                                    fontWeight: LocalTheme.home["student_name"]
                                        ["font_weight"],
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
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(
                            top: 0.0,
                            right: 0.0,
                            bottom: 2.0,
                            left: 0.0,
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 160,
                                height: 25,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(
                                  top: 0.0,
                                  right: 0.0,
                                  bottom: 0.0,
                                  left: 18.0,
                                ),
                                child: Text(
                                  "Total Fee Pending",
                                  style: TextStyle(
                                    color: LocalTheme.home["student_name"]
                                        ["color"],
                                    fontWeight: LocalTheme.home["student_name"]
                                        ["font_weight"],
                                    fontFamily: LocalTheme.home["student_name"]
                                        ["font_family"],
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 25,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(
                                  top: 0.0,
                                  right: 0.0,
                                  bottom: 0.0,
                                  left: 13.0,
                                ),
                                child: Text(
                                  "INR 10,000.00",
                                  style: TextStyle(
                                    color: LocalTheme.home["student_name"]
                                        ["color"],
                                    fontWeight: LocalTheme.home["student_name"]
                                        ["font_weight"],
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
                          alignment: Alignment.centerLeft,
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1.0, color: Color(0xFF6E6E6E1A)))),
                          padding: EdgeInsets.only(
                            top: 0.0,
                            right: 0.0,
                            bottom: 2.0,
                            left: 0.0,
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 160,
                                height: 25,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(
                                  top: 0.0,
                                  right: 0.0,
                                  bottom: 0.0,
                                  left: 18.0,
                                ),
                                child: Text(
                                  "INR 10,000.00",
                                  style: TextStyle(
                                    color: LocalTheme.home["student_name"]
                                        ["color"],
                                    fontWeight: LocalTheme.home["student_name"]
                                        ["font_weight"],
                                    fontFamily: LocalTheme.home["student_name"]
                                        ["font_family"],
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 25,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(
                                  top: 0.0,
                                  right: 0.0,
                                  bottom: 0.0,
                                  left: 13.0,
                                ),
                                child: Text(
                                  "0.00",
                                  style: TextStyle(
                                    color: LocalTheme.home["student_name"]
                                        ["color"],
                                    fontWeight: LocalTheme.home["student_name"]
                                        ["font_weight"],
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
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(
                            top: 0.0,
                            right: 0.0,
                            bottom: 2.0,
                            left: 0.0,
                          ),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 160,
                                height: 25,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(
                                  top: 0.0,
                                  right: 0.0,
                                  bottom: 0.0,
                                  left: 18.0,
                                ),
                                child: Text(
                                  "Unpaid",
                                  style: TextStyle(
                                    color: LocalTheme.home["student_name"]
                                        ["color"],
                                    fontWeight: LocalTheme.home["student_name"]
                                        ["font_weight"],
                                    fontFamily: LocalTheme.home["student_name"]
                                        ["font_family"],
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 25,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(
                                  top: 0.0,
                                  right: 0.0,
                                  bottom: 0.0,
                                  left: 13.0,
                                ),
                                child: Text(
                                  "INR 10,000.00",
                                  style: TextStyle(
                                    color: LocalTheme.home["student_name"]
                                        ["color"],
                                    fontWeight: LocalTheme.home["student_name"]
                                        ["font_weight"],
                                    fontFamily: LocalTheme.home["student_name"]
                                        ["font_family"],
                                    fontSize: 12,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          Visibility(
            visible: _feepayment,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 50.0, right: 50.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 10, right: 20),
                    child: RaisedButton(
                      onPressed: () {
                        
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      child: Text(
                        'Pay Now',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Color(0xFF7ED321),
                      textColor: Colors.black,
                    ),
                  ),
                  Container(
                    // margin: EdgeInsets.only(left: 10, right: 10),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/paymentDetail");
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      child: Text(
                        'View Details',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Color(0xFFFDCA40),
                      textColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: _paymentHistory,
            child: Container(
              height: 240.0,
              padding: EdgeInsets.only(
                top: 20.0,
                right: 0.0,
                bottom: 0.0,
                left: 20.0,
              ),
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.calendar_today),
                    title: Text(
                      "Exam Fee",
                      style: TextStyle(
                        color: LocalTheme.home["student_name"]["color"],
                        fontWeight: LocalTheme.home["student_name"]
                            ["font_weight"],
                        fontFamily: LocalTheme.home["student_name"]
                            ["font_family"],
                        fontSize: 12,
                      ),
                    ),
                    subtitle: Text(
                      "INR 4,500.00",
                      style: TextStyle(
                        color: LocalTheme.home["student_name"]["color"],
                        fontWeight: LocalTheme.home["student_name"]
                            ["font_weight"],
                        fontFamily: LocalTheme.home["student_name"]
                            ["font_family"],
                        fontSize: 12,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.calendar_today),
                    title: Text(
                      "Transport Fee",
                      style: TextStyle(
                        color: LocalTheme.home["student_name"]["color"],
                        fontWeight: LocalTheme.home["student_name"]
                            ["font_weight"],
                        fontFamily: LocalTheme.home["student_name"]
                            ["font_family"],
                        fontSize: 12,
                      ),
                    ),
                    subtitle: Text(
                      "INR 8,000.00",
                      style: TextStyle(
                        color: LocalTheme.home["student_name"]["color"],
                        fontWeight: LocalTheme.home["student_name"]
                            ["font_weight"],
                        fontFamily: LocalTheme.home["student_name"]
                            ["font_family"],
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
