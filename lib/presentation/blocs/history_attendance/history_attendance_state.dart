part of 'history_attendance_bloc.dart';

@freezed
class HistoryAttendanceState with _$HistoryAttendanceState {
  const factory HistoryAttendanceState.initial() = _Initial;
  const factory HistoryAttendanceState.loading() = _Loading;
  const factory HistoryAttendanceState.failure(String message) = _Failure;
  const factory HistoryAttendanceState.success(List<ScheduleWeek> data) =
      _Success;
}
