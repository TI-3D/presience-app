import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presience_app/data/dto/requests/forgot_password_dto.dart';

import '../../../data/datasources/remote_datasources/auth_remote_datasource.dart';

part 'forgot_password_bloc.freezed.dart';
part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final AuthRemoteDatasource _authRemoteDatasource;
  ForgotPasswordBloc(
    this._authRemoteDatasource,
  ) : super(const _Initial()) {
    on<_ForgotPassword>((event, emit) async {
      emit(const _Loading());
      final result = await _authRemoteDatasource.forgotPassword(event.params);
      result.fold(
        (l) => emit(_Failure(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
