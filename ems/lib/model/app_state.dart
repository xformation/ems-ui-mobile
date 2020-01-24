class AppState {
  Map<String, dynamic> studentAttendaceCache = new Map();
  Map<String, dynamic> studentAttendanceData = new Map();
  // AppState({this.studentAttendaceCache, this.studentAttendanceData});
  AppState();

  AppState.update(AppState reference) {
    studentAttendanceData = reference.studentAttendanceData;
    studentAttendaceCache = reference.studentAttendaceCache;
  }
}
