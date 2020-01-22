import 'package:graphql/client.dart';

import 'package:ems/queries/attendance/student_attendance_cache.dart';
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
}
