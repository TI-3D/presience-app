part of 'permit_bloc.dart';

@freezed
class PermitState with _$PermitState {
  const factory PermitState.initial() = _Initial;
  const factory PermitState.loading() = _Loading;
  const factory PermitState.failure(String message) = _Failure;
  const factory PermitState.success(List<PermitDetail> data) = _Success;
}
