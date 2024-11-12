part of 'history_attendance_bloc.dart';

@freezed
class HistoryAttendanceEvent with _$HistoryAttendanceEvent {
  const factory HistoryAttendanceEvent.started() = _Started;
  const factory HistoryAttendanceEvent.getHistoryAttendance(
      GetHistoryAttendanceDto params) = _GetHistoryAttendance;
}
