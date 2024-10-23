import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presience_app/data/datasources/remote_datasources/schedule_remote_datasource.dart';
import 'package:presience_app/domain/entities/schedule_week.dart';

part 'schedule_bloc.freezed.dart';
part 'schedule_event.dart';
part 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  final ScheduleRemoteDatasource _scheduleRemoteDatasource;
  ScheduleBloc(
    this._scheduleRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetSchedulesToday>((event, emit) async {
      emit(const _Loading());
      final response = await _scheduleRemoteDatasource.getSchedulesToday();
      response.fold(
        (l) => emit(_Failure(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
