import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presience_app/data/dto/requests/get_history_attendance_dto.dart';
import 'package:presience_app/data/dto/requests/permit_before_schedule_dto.dart';
import 'package:presience_app/domain/entities/schedule_week.dart';

import '../../../data/datasources/remote_datasources/attendance_remote_datasource.dart';

part 'history_attendance_bloc.freezed.dart';
part 'history_attendance_event.dart';
part 'history_attendance_state.dart';

class HistoryAttendanceBloc
    extends Bloc<HistoryAttendanceEvent, HistoryAttendanceState> {
  final AttendanceRemoteDatasource _attendanceRemoteDatasource;
  HistoryAttendanceBloc(
    this._attendanceRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetHistoryAttendance>((event, emit) async {
      emit(const _Loading());
      final response =
          await _attendanceRemoteDatasource.getHistoryAttendance(event.params);
      response.fold(
        (l) => emit(_Failure(l)),
        (r) => emit(_Success(r)),
      );
    });

    on<_StorePermitBeforeSchedule>((event, emit) async {
      List<ScheduleWeek> schedules = [];

      state.maybeWhen(
        success: (data) => schedules = List<ScheduleWeek>.from(data),
        orElse: () {},
      );

      emit(const _Loading());

      final response = await _attendanceRemoteDatasource
          .storePermitBeforeSchedule(event.params);
      response.fold(
        (l) => emit(_Failure(l)),
        (newSchedules) {
          // Append new schedules to the existing list while avoiding duplicates
          final updatedSchedules = [
            ...schedules,
            ...newSchedules.where((newSchedule) =>
                schedules.every((existing) => existing.id != newSchedule.id))
          ];

          emit(_Success(updatedSchedules));
        },
      );
    });
  }
}
