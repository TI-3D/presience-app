part of 'attendance_bloc.dart';

@freezed
class AttendanceState with _$AttendanceState {
  const factory AttendanceState.initial() = _Initial;
  const factory AttendanceState.loading() = _Loading;
  const factory AttendanceState.failure(String message) = _Failure;
  const factory AttendanceState.success(AttendanceInformation data) = _Success;
}
