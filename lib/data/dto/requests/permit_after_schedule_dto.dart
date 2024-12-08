import 'dart:io';

class PermitAfterScheduleDto {
  final int? attendanceId;
  final String? type;
  final String? description;
  final File? evidence;

  const PermitAfterScheduleDto({
    this.attendanceId,
    this.type,
    this.description,
    this.evidence,
  });

  Map<String, dynamic> toJson() {
    return {
      'attendance_id': attendanceId,
      'permit_type': type,
      'description': description,
      'evidence': evidence,
    };
  }

  PermitAfterScheduleDto copyWith({
    int? attendanceId,
    String? type,
    String? description,
    File? evidence,
  }) {
    return PermitAfterScheduleDto(
      attendanceId: attendanceId ?? this.attendanceId,
      type: type ?? this.type,
      description: description ?? this.description,
      evidence: evidence ?? this.evidence,
    );
  }
}
