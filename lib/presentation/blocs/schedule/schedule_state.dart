part of 'schedule_bloc.dart';

@freezed
class ScheduleState with _$ScheduleState {
  const factory ScheduleState.initial() = _Initial;
  const factory ScheduleState.loading() = _Loading;
  const factory ScheduleState.failure(String message) = _Failure;
  const factory ScheduleState.success(List<ScheduleWeek> data) = _Success;
}
