const String updatestudentAttendanceData = r'''
mutation updateStudentAttendanceData($input: [StudentAttendanceUpdateFilter!]!){
  updateStudentAttendanceData(input:$input){
    statusCode
    statusDesc
 }
}
''';

