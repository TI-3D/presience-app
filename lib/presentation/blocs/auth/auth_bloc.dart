import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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

    on<_ChangePassword>((event, emit) async {
      AuthDto? user;
      state.maybeWhen(
        loginSuccess: (model) => user = model,
        orElse: () {},
      );

      emit(const _Loading());

      final result = await _authRemoteDatasource.changePassword(event.params);
      result.fold(
        (l) => emit(_Failure(l)),
        (r) => emit(_SuccessLogin(user!)),
      );
    });
  }
}
