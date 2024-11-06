class GetScheduleDto {
  final String? startDate;
  final String? endDate;

  const GetScheduleDto({
    this.startDate,
    this.endDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'start_date': startDate,
      'end_date': endDate,
    };
  }

  GetScheduleDto copyWith({
    String? startDate,
    String? endDate,
  }) {
    return GetScheduleDto(
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }
}
