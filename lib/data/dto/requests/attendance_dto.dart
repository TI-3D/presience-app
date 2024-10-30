import 'dart:io';

class AttendanceDto {
  final int? scheduleWeekId;
  final String? description;
  final File? evidence;

  const AttendanceDto({
    this.scheduleWeekId,
    this.description,
    this.evidence,
  });

  Map<String, dynamic> toJson() {
    return {
      'sw_id': scheduleWeekId,
      'description': description,
      'evidence': evidence,
    };
  }

  AttendanceDto copyWith({
    int? scheduleWeekId,
    String? description,
    File? evidence,
  }) {
    return AttendanceDto(
      scheduleWeekId: scheduleWeekId ?? this.scheduleWeekId,
      description: description ?? this.description,
      evidence: evidence ?? this.evidence,
    );
  }
}
