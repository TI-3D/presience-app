// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
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
  Timer? _pollingTimer;

  void _startPolling() {
    // Start polling with a 5-second interval
    _pollingTimer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      final response = await _scheduleRemoteDatasource.getSchedulesToday();
      response.fold(
        (l) {
          emit(ScheduleState.failure(l));
        },
        (r) {
          // Check if any schedule is 'opened' and has null attendance
          final openedSchedule = r.firstWhereOrNull(
            (schedule) =>
                schedule.status == 'opened' && schedule.attendance == null,
          );

          if (openedSchedule != null) {
            // Cancel polling if condition is met
            _pollingTimer?.cancel();
            emit(ScheduleState.success(r));
          } else {
            // Otherwise, continue polling and update the state if needed
            emit(ScheduleState.success(r));
          }
        },
      );
    });
  }

  ScheduleBloc(
    this._scheduleRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetSchedulesToday>((event, emit) async {
      emit(const _Loading());
      final response = await _scheduleRemoteDatasource.getSchedulesToday();
      response.fold(
        (l) => emit(_Failure(l)),
        (r) {
          emit(_Success(r));
          _startPolling();
        },
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
