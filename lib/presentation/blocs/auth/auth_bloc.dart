import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presience_app/data/datasources/local_datasources/auth_local_datasources.dart';
import 'package:presience_app/data/dto/requests/auth_dto.dart';
import 'package:presience_app/data/dto/requests/change_password_dto.dart';
import 'package:presience_app/data/dto/requests/login_dto.dart';

import '../../../data/datasources/remote_datasources/auth_remote_datasource.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRemoteDatasource _authRemoteDatasource;
  AuthBloc(
    this._authRemoteDatasource,
  ) : super(const _Initial()) {
    on<_Login>((event, emit) async {
      emit(const _Loading());
      final result = await _authRemoteDatasource.login(event.params);
      result.fold(
        (l) => emit(_Failure(l)),
        (r) => emit(_SuccessLogin(r)),
      );
    });

    on<_CheckLoginStatus>((event, emit) async {
      emit(const _Loading());
      final authData = await AuthLocalDataSource().getAuthData();

      if (authData != null && authData.expiration!.isAfter(DateTime.now())) {
        emit(AuthState.loginSuccess(authData));
      } else {
        await AuthLocalDataSource().removeAuthData();
        emit(const AuthState.initial());
      }
    });

    on<_ChangePassword>((event, emit) async {
      AuthDto? user;
      state.maybeWhen(
        loginSuccess: (model) => user = model,
        orElse: () => emit(const _Failure('User not logged in')),
      );

      // Pastikan data `user` sudah terisi sebelum melanjutkan
      if (user == null) {
        emit(const _Failure('User data not available'));
        return;
      }

      emit(const _Loading());

      final result = await _authRemoteDatasource.changePassword(event.params);
      result.fold(
        (l) => emit(_Failure(l)),
        (r) => emit(_SuccessLogin(user!)),
      );
    });

    on<_Logout>((event, emit) async {
      emit(const _Loading());

      await AuthLocalDataSource().removeAuthData();

      emit(const AuthState.initial());
    });
  }
}
