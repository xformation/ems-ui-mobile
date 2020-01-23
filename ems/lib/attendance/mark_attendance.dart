import 'package:flutter/material.dart';
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
  _MarkAttendanceState createState() => _MarkAttendanceState();
}

class _MarkAttendanceState extends State<MarkAttendance> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Mark Attendance"),
        ),
        body: StoreConnector<AppState, MarkAttendanceViewModel>(
            converter: (store) => MarkAttendanceViewModel.build(store),
            builder: (context, viewModel) {
              return Column(
                children: <Widget>[
                  FlatButton(
                    onPressed: () => viewModel.onRefresh(_onViewStateChanged),
                    child: Text('Refresh'),
                  ),
                  Expanded(
                    child: _isLoading
                        ? Center(child: CircularProgressIndicator())
                          : createDropdownbox(
                              viewModel.studentAttendaceCache["departments"])),
                ],
              );
            }));
  }

  void _onViewStateChanged(bool isLoading) {
    setState(() {
      _isLoading = isLoading;
    });
  }

  Widget createDropdownbox(dynamic data) {
    if (data != null) {
      return DropdownButton<String>(
        value: "1901",
        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String newValue) {},
        items: data.map<DropdownMenuItem<String>>((dynamic item) {
          return DropdownMenuItem<String>(
            value: item["id"].toString(),
            child: Text(item["name"]),
          );
        }).toList(),
      );
    }
    return Text("Loading");
  }
}

class MarkAttendanceViewModel {
  final Map<String, dynamic> studentAttendaceCache;
  final Function(OnStateChanged) onRefresh;
  MarkAttendanceViewModel({this.studentAttendaceCache, this.onRefresh});

  static MarkAttendanceViewModel build(Store<AppState> store) {
    return MarkAttendanceViewModel(
      studentAttendaceCache: store.state.studentAttendaceCache,
      onRefresh: (callback) {
        store.dispatch(FetchStudentAttendanceCacheAction(callback));
      },
    );
  }
}

String getPrettyJSONString(Object jsonObject) {
  return const JsonEncoder.withIndent('  ').convert(jsonObject);
}

typedef OnStateChanged = Function(bool isLoading);
