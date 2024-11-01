import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presience_app/data/datasources/remote_datasources/permit_remote_datasource.dart';
import 'package:presience_app/domain/entities/permit_detail.dart';

part 'permit_bloc.freezed.dart';
part 'permit_event.dart';
part 'permit_state.dart';

class PermitBloc extends Bloc<PermitEvent, PermitState> {
  final PermitRemoteDatasource _permitRemoteDatasource;
  PermitBloc(
    this._permitRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetHistoryPermit>((event, emit) async {
      emit(const _Loading());
      final response = await _permitRemoteDatasource.getHistoryPermit();
      response.fold(
        (l) => emit(_Failure(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
