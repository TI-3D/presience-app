import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presience_app/domain/entities/attendance.dart';
import 'package:presience_app/domain/entities/schedule.dart';

part 'schedule_week.freezed.dart';
part 'schedule_week.g.dart';

@freezed
class ScheduleWeek with _$ScheduleWeek {
  const factory ScheduleWeek({
    int? id,
    DateTime? date,
    bool? isOnline,
    String? status,
    String? openedAt,
    String? closedAt,
    Schedule? schedule,
    Attendance? attendance,
  }) = _ScheduleWeek;

  factory ScheduleWeek.fromJson(Map<String, dynamic> json) => ScheduleWeek(
        id: json['id'],
        date: DateTime.parse(json['date']),
        isOnline: json['is_online'],
        status: json['status'],
        openedAt: json['opened_at'],
        closedAt: json['closed_at'],
        schedule: Schedule.fromJson(json['schedule']),
        attendance: json['attendance'] != null
            ? Attendance.fromJson(json['attendance'])
            : null,
      );
}
