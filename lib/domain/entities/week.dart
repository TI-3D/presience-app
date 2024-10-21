import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presience_app/domain/entities/schedule_week.dart';

part 'week.freezed.dart';
part 'week.g.dart';

@freezed
class Week with _$Week {
  const factory Week({
    int? id,
    String? name,
    DateTime? startDate,
    DateTime? endDate,
    ScheduleWeek? scheduleWeek,
  }) = _Week;

  factory Week.fromJson(Map<String, dynamic> json) => Week(
        id: json['id'],
        name: json['name'],
        startDate: DateTime.parse(json['start_date']),
        endDate: DateTime.parse(json['end_date']),
        scheduleWeek: ScheduleWeek.fromJson(json['schedule_week']),
      );
}
