import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presience_app/domain/entities/schedule_week.dart';

part 'attendance.freezed.dart';
part 'attendance.g.dart';

@freezed
class Attendance with _$Attendance {
  const factory Attendance({
    int? id,
    int? sakit,
    int? izin,
    int? alpha,
    String? entryTime,
    bool? isChanged,
    bool? lecturerVerified,
    ScheduleWeek? scheduleWeek,
  }) = _Attendance;

  factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
        id: json['id'],
        sakit: json['sakit'],
        izin: json['izin'],
        alpha: json['alpha'],
        entryTime: json['entry_time'],
        isChanged: json['is_changed'],
        lecturerVerified: json['lecturer_verified'],
        scheduleWeek: ScheduleWeek.fromJson(json['schedule_week']),
      );
}
