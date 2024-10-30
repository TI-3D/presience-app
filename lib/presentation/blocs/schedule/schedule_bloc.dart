import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presience_app/data/datasources/remote_datasources/schedule_remote_datasource.dart';
import 'package:presience_app/data/dto/requests/attendance_dto.dart';
import 'package:presience_app/data/dto/requests/permit_dto.dart';
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

    on<_StoreAttendance>((event, emit) async {
      List<ScheduleWeek> schedules = [];

      state.maybeWhen(
        success: (data) => schedules = List<ScheduleWeek>.from(data),
        orElse: () {},
      );

      emit(const _Loading());

      final response =
          await _scheduleRemoteDatasource.storeAttendance(event.params);
      response.fold(
        (l) => emit(_Failure(l)),
        (r) {
          // Update the schedules list with the new data if the id matches
          schedules = schedules.map((schedule) {
            // Replace schedule with the updated one if the id matches
            return schedule.id == r.id ? r : schedule;
          }).toList();

          // Emit the updated schedules list in the _Success state
          emit(_Success(schedules));
        },
      );
    });

    on<_StoreCurrentPermit>((event, emit) async {
      List<ScheduleWeek> schedules = [];

      state.maybeWhen(
        success: (data) => schedules = List<ScheduleWeek>.from(data),
        orElse: () {},
      );

      emit(const _Loading());

      final response =
          await _scheduleRemoteDatasource.storeCurrentPermit(event.params);
      response.fold(
        (l) => emit(_Failure(l)),
        (r) {
          // Update the schedules list with the new data if the id matches
          schedules = schedules.map((schedule) {
            // Replace schedule with the updated one if the id matches
            return schedule.id == r.id ? r : schedule;
          }).toList();

          // Emit the updated schedules list in the _Success state
          emit(_Success(schedules));
        },
      );
    });
  }
}
