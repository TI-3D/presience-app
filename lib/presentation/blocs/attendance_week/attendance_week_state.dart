part of 'attendance_week_bloc.dart';

@freezed
class AttendanceWeekState with _$AttendanceWeekState {
  const factory AttendanceWeekState.initial() = _Initial;
  const factory AttendanceWeekState.loading() = _Loading;
  const factory AttendanceWeekState.failure(String message) = _Failure;
  const factory AttendanceWeekState.success(List<ScheduleWeek> data) = _Success;
}
