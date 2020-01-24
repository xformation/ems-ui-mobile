const String getstudentAttendanceData = r'''
mutation getStudentAttendanceDataForAdmin($filter:StudentAttendanceFilterInput!) {
  getStudentAttendanceDataForAdmin(filter: $filter) {
    studentId
    studentName
    currentDateStatus
    comments
 }
}
''';
