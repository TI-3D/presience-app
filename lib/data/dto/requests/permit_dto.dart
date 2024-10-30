import 'dart:io';

class PermitDto {
  final int? scheduleWeekId;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? type;
  final String? description;
  final File? evidence;

  const PermitDto({
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

  PermitDto copyWith({
    int? scheduleWeekId,
    DateTime? startDate,
    DateTime? endDate,
    String? type,
    String? description,
    File? evidence,
  }) {
    return PermitDto(
      scheduleWeekId: scheduleWeekId ?? this.scheduleWeekId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      type: type ?? this.type,
      description: description ?? this.description,
      evidence: evidence ?? this.evidence,
    );
  }
}
