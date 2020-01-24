import 'package:graphql/client.dart';
import 'package:ems/queries/attendance/student_attendance_cache.dart';
import 'package:ems/queries/attendance/take_student_attendance.dart';
import 'package:ems/graphql_client.dart';

class ApiClient {
  Future<QueryResult> fetchStudentAttendanceCache() async {
    final QueryOptions options = QueryOptions(
      document: studentAttendanceCache,
      variables: <String, dynamic>{
        "branchId": "1851",
        "academicYearId": "1701",
        "lectureDate": "22-01-2020"
      },
    );
    final QueryResult result = await GraphQLClientAPI.client().query(options);
    return result;
  }

//takeStudentAttendance call
  Future<QueryResult> getStudentAttendanceCache() async {
    final QueryOptions options = QueryOptions(
      document: takestudentAttendanceCache,
      variables: <String, dynamic>{
        "branchId": "1851",
        "departmentId": "1901",
        "batchId": "1951",
        "sectionId": "2001",
        "subjectId": "2101",
        "attendanceDate": "07-01-2019",
        "lectureId": "3499",
        "academicYearId": "1701",
        "termId": "1751"
      },
    );
    final QueryResult result = await GraphQLClientAPI.client().query(options);
    return result;
  }
}


