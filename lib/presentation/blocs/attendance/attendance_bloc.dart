import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presience_app/data/datasources/remote_datasources/attendance_remote_datasource.dart';
import 'package:presience_app/domain/entities/attendance_information.dart';

part 'attendance_bloc.freezed.dart';
part 'attendance_event.dart';
part 'attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  final AttendanceRemoteDatasource _attendanceRemoteDatasource;
  AttendanceBloc(
    this._attendanceRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetAttendanceInformation>((event, emit) async {
      emit(const _Loading());
      final response =
          await _attendanceRemoteDatasource.getAttendanceInformation();
      response.fold(
        (l) => emit(_Failure(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
