part of 'attendance_week_bloc.dart';

@freezed
class AttendanceWeekEvent with _$AttendanceWeekEvent {
  const factory AttendanceWeekEvent.started() = _Started;
  const factory AttendanceWeekEvent.getHistoryAttendanceWeek() =
      _GetHistoryAttendanceWeek;
  const factory AttendanceWeekEvent.getScheduleByDate(GetScheduleDto params) =
      _GetScheduleByDate;
}
