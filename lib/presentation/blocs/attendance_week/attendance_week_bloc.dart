import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presience_app/data/datasources/remote_datasources/attendance_remote_datasource.dart';
import 'package:presience_app/domain/entities/schedule_week.dart';

part 'attendance_week_bloc.freezed.dart';
part 'attendance_week_event.dart';
part 'attendance_week_state.dart';

class AttendanceWeekBloc
    extends Bloc<AttendanceWeekEvent, AttendanceWeekState> {
  final AttendanceRemoteDatasource _attendanceRemoteDatasource;
  AttendanceWeekBloc(
    this._attendanceRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetHistoryAttendanceWeek>((event, emit) async {
      emit(const _Loading());
      final response =
          await _attendanceRemoteDatasource.getHistoryAttendanceWeek();
      response.fold(
        (l) => emit(_Failure(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
