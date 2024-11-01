part of 'permit_bloc.dart';

@freezed
class PermitEvent with _$PermitEvent {
  const factory PermitEvent.started() = _Started;
  const factory PermitEvent.getHistoryPermit() = _GetHistoryPermit;
}
