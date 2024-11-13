import 'dart:io';

class AttendanceDto {
  final int? scheduleWeekId;
  final String? description;
  final File? evidence;
  final double? latitude;
  final double? longitude;

  const AttendanceDto({
    this.scheduleWeekId,
    this.description,
    this.evidence,
    this.latitude,
    this.longitude,
  });

  Map<String, dynamic> toJson() {
    return {
      'sw_id': scheduleWeekId,
      'description': description,
      'evidence': evidence,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  AttendanceDto copyWith({
    int? scheduleWeekId,
    String? description,
    File? evidence,
    double? latitude,
    double? longitude,
  }) {
    return AttendanceDto(
      scheduleWeekId: scheduleWeekId ?? this.scheduleWeekId,
      description: description ?? this.description,
      evidence: evidence ?? this.evidence,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}
