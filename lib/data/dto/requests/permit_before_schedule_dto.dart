import 'dart:io';

class PermitBeforeScheduleDto {
  final List<int>? scheduleWeekId;
  final String? startDate;
  final String? endDate;
  final String? type;
  final String? description;
  final File? evidence;

  const PermitBeforeScheduleDto({
    this.scheduleWeekId,
    this.startDate,
    this.endDate,
    this.type,
    this.description,
    this.evidence,
  });

  Map<String, dynamic> toJson() {
    return {
      'sw_id': scheduleWeekId,
      'start_date': startDate,
      'end_date': endDate,
      'permit_type': type,
      'description': description,
      'evidence': evidence,
    };
  }

  PermitBeforeScheduleDto copyWith({
    List<int>? scheduleWeekId,
    String? startDate,
    String? endDate,
    String? type,
    String? description,
    File? evidence,
  }) {
    return PermitBeforeScheduleDto(
      scheduleWeekId: scheduleWeekId ?? this.scheduleWeekId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      type: type ?? this.type,
      description: description ?? this.description,
      evidence: evidence ?? this.evidence,
    );
  }
}
