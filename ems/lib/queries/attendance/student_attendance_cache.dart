const String studentAttendanceCache = r'''
  query createStudentAttendanceCacheForAdmin($branchId: String, $academicYearId: String, $lectureDate: String) {
  createStudentAttendanceCacheForAdmin(branchId: $branchId, academicYearId: $academicYearId, lectureDate: $lectureDate) {
    departments {
      id
      name
      description
      academicyear {
        id
        year
      }
    }
  }
}
''';