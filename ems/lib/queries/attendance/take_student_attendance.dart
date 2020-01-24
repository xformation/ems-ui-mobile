const String takestudentAttendanceCache = r'''
mutation getStudentAttendanceDataForAdmin($filter:StudentAttendanceFilterInput!) {
  getStudentAttendanceDataForAdmin(filter: $filter) {
    studentId
    studentName
    currentDateStatus
    comments
 }
}
''';
