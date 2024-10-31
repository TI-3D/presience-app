import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_information.freezed.dart';
part 'attendance_information.g.dart';

@freezed
class AttendanceInformation with _$AttendanceInformation {
  const factory AttendanceInformation({
    int? percentageAttendance,
    int? sakit,
    int? izin,
    int? alpha,
    int? kompen,
    String? description,
  }) = _AttendanceInformation;

  factory AttendanceInformation.fromJson(Map<String, dynamic> json) =>
      AttendanceInformation(
        percentageAttendance: json['percentage_attendance'],
        sakit: json['sakit'],
        izin: json['izin'],
        alpha: json['alpha'],
        kompen: json['kompen'],
        description: json['description'],
      );
}
