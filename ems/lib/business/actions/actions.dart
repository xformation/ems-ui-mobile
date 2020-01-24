enum ActionType { FetchStudentAttendanceCache, LoadStudentAttendanceCache, FetchStudentAttendanceData, LoadStudentAttendanceData }

class GlobalAction {
  final dynamic _callback;
  final ActionType _actionType;
  final Map<String, dynamic> _data;
  GlobalAction(this._actionType, this._data, this._callback);

  ActionType get actionType => _actionType;
  Map<String, dynamic> get data => _data;
  dynamic get callback {
    if(_callback == null){
      return (dynamic arg) => arg;
    }
    return _callback;
  }
}
