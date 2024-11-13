part of 'schedule_bloc.dart';

@freezed
class ScheduleEvent with _$ScheduleEvent {
  const factory ScheduleEvent.started() = _Started;
  const factory ScheduleEvent.getSchedulesToday() = _GetSchedulesToday;
  const factory ScheduleEvent.storeAttendance(AttendanceDto params) =
      _StoreAttendance;
  const factory ScheduleEvent.storeCurrentPermit(PermitDto params) =
      _StoreCurrentPermit;
  const factory ScheduleEvent.startPolling() = _StartPolling;
  const factory ScheduleEvent.stopPolling() = _StopPolling;
}
