class GetHistoryAttendanceDto {
  final int? courseId;
  final String? attendanceStatus;

  const GetHistoryAttendanceDto({
    this.courseId,
    this.attendanceStatus,
  });

  Map<String, dynamic> toJson() {
    return {
      'course_id': courseId,
      'attendance_status': attendanceStatus,
    };
  }

  GetHistoryAttendanceDto copyWith({
    int? courseId,
    String? attendanceStatus,
  }) {
    return GetHistoryAttendanceDto(
      courseId: courseId ?? this.courseId,
      attendanceStatus: attendanceStatus ?? this.attendanceStatus,
    );
  }
}
