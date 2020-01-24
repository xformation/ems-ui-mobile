class AppState {
  Map<String, dynamic> studentAttendaceCache = new Map();
  List<dynamic> studentAttendanceData = new List();
  // AppState({this.studentAttendaceCache, this.studentAttendanceData});
  AppState();

  AppState.update(AppState reference) {
    studentAttendanceData = reference.studentAttendanceData;
    studentAttendaceCache = reference.studentAttendaceCache;
  }
}
