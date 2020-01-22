class ApiClient {
  Future<Map<String, dynamic>> fetchStudentAttendanceCache() {
    return Future.delayed(Duration(seconds: 3), () {
      return {"abc": "Test"};
    });
  }
}
