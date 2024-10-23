part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.failure(String message) = _Failure;
  const factory AuthState.loginSuccess(AuthDto model) = _SuccessLogin;
  const factory AuthState.logoutSuccess() = _SuccessLogout;
}
