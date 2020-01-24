import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';

import 'package:ems/business/actions/actions.dart';
import 'package:ems/model/app_state.dart';

class MarkAttendancePage extends StatelessWidget {
  final Store<AppState> store;

  MarkAttendancePage(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
            title: "Mark Attendance",
            theme: ThemeData(primarySwatch: Colors.blue),
            home: StoreBuilder<AppState>(
                builder: (context, store) => MarkAttendance(store))));
  }
}

class MarkAttendance extends StatefulWidget {
  final DevToolsStore<AppState> store;

  MarkAttendance(this.store);
  _MarkAttendanceState createState() => _MarkAttendanceState(this.store);
}

class _MarkAttendanceState extends State<MarkAttendance> {
  final format = DateFormat("dd-M-yyyy");
  Store<AppState> _store;
  bool _isLoading = true;
  bool _isgetstudentattendanceData = true;
  _MarkAttendanceState(this._store);

  @override
  void initState() {
    super.initState();
    // _store.dispatch(FetchStudentAttendanceCacheAction(_onViewStateChanged));
    _store.dispatch(GlobalAction(
        ActionType.FetchStudentAttendanceCache, null, _onViewStateChanged));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Mark Attendance"),
        ),
        body: StoreConnector<AppState, MarkAttendanceViewModel>(
            converter: (store) => MarkAttendanceViewModel.build(store),
            builder: (context, viewModel) {
              return Center(
                child: Form(
                    // key: formKey,
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: _isLoading
                          ? Center(child: CircularProgressIndicator())
                          : Container(
                              padding: new EdgeInsets.all(10.0),
                              child: Column(
                                children: <Widget>[
                                  createDropdownbox(
                                      data: viewModel
                                          .studentAttendaceCache["departments"],
                                      keyValue: "id",
                                      keyName: "name"),
                                  createDropdownbox(
                                      data: viewModel
                                          .studentAttendaceCache["batches"],
                                      keyValue: "id",
                                      keyName: "batch"),
                                  createDropdownbox(
                                      data: viewModel
                                          .studentAttendaceCache["subjects"],
                                      keyValue: "id",
                                      keyName: "subjectType"),
                                  createDropdownbox(
                                      data: viewModel
                                          .studentAttendaceCache["sections"],
                                      keyValue: "id",
                                      keyName: "section"),
                                  // createDropdownbox(
                                  //     data: viewModel
                                  //         .studentAttendaceCache["lectures"],
                                  //     keyValue: "id",
                                  //     keyName: "strLecDate"),
                                  DateTimeField(
                                    format: format,
                                    initialValue: DateTime.now(),
                                    onShowPicker: (context, currentValue) {
                                      return showDatePicker(
                                          context: context,
                                          firstDate: DateTime(1900),
                                          initialDate: DateTime.now(),
                                          lastDate: DateTime(2100));
                                    },
                                  ),
                                  new RaisedButton(
                                    onPressed: _getattendanceData,
                                    textColor: Colors.white,
                                    color: Colors.blueAccent,
                                    padding: const EdgeInsets.all(8.0),
                                    child: new Text(
                                      "Take Attendance",
                                    ),
                                  ),
                                ],
                              )),
                    ),
                    Expanded(
                        child: _isgetstudentattendanceData
                            ? Center()
                            : Container(
                                padding: new EdgeInsets.all(10.0),
                                child: Column(
                                  children: <Widget>[
                                    studentAttendancelist(
                                      value: viewModel.studentAttendanceData,
                                    ),
                                  ],
                                ))),
                  ],
                )),
              );
            }));
  }

  void _onViewStateChanged(bool isLoading) {
    setState(() {
      _isLoading = isLoading;
    });
  }

  Widget createDropdownbox(
      {@required dynamic data,
      @required String keyValue,
      @required String keyName}) {
    if (!_isLoading) {
      return DropdownButton<String>(
        isExpanded: true,
        value: data[0][keyValue].toString(),
        elevation: 10,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent[50],
        ),
        items: data.map<DropdownMenuItem<String>>((dynamic item) {
          return DropdownMenuItem<String>(
            value: item[keyValue].toString(),
            child: Text(item[keyName]),
            // overflow: TextOverflow.ellipsis,
          );
        }).toList(),
        onChanged: (String newValue) {},
      );
    }
    return Text("No record found");
  }

  _getattendanceData() {
    _store.dispatch(GlobalAction(
        ActionType.FetchStudentAttendanceData, null, _onTakeStateChanged));
  }

  void _onTakeStateChanged(bool isLoading) {
    setState(() {
      _isgetstudentattendanceData = isLoading;
    });
  }

  Widget studentAttendancelist({@required dynamic value}) {
    print(_isgetstudentattendanceData);
    print(value);
    if (!_isgetstudentattendanceData) {
      return DataTable(
        columns: <DataColumn>[
          DataColumn(
              label: Text("StudentId"),
              numeric: true,
              tooltip: "To display StudentId"),
          DataColumn(
              label: Text("Student Name"),
              numeric: false,
              tooltip: "To display Student Name"),
          DataColumn(
              label: Text("Attendance"),
              numeric: false,
              tooltip: "To display Attendance"),
        ],
        rows: _createRows(value),
      );
    }
    return Text("no data found");
  }

  List<DataRow> _createRows(listOfRows){
    final length = listOfRows.length;
    List<DataRow> retData = [];
    for(var i=0;i<length;i++){
      var row = listOfRows[i];
      retData.add(DataRow(
        cells:[
          DataCell(Text(row["studentId"])),
          DataCell(Text(row["studentName"])),
          DataCell(Text(row["currentDateStatus"])),
        ]
      ));
    }
    return retData;
  }
}

class MarkAttendanceViewModel {
  final Map<String, dynamic> studentAttendaceCache;
  final List<dynamic> studentAttendanceData;
  MarkAttendanceViewModel(
      {this.studentAttendaceCache, this.studentAttendanceData});

  static MarkAttendanceViewModel build(Store<AppState> store) {
    return MarkAttendanceViewModel(
        studentAttendaceCache: store.state.studentAttendaceCache,
        studentAttendanceData: store.state.studentAttendanceData);
  }
}

typedef OnStateChanged = void Function(bool isLoading);
