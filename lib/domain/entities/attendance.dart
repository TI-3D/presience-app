import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance.freezed.dart';
part 'attendance.g.dart';

@freezed
class Attendance with _$Attendance {
  const factory Attendance({
    int? id,
    int? sakit,
    int? izin,
    int? alpha,
    String? entryTime,
    bool? isChanged,
    bool? lecturerVerified,
    int? precentage,
  }) = _Attendance;

  factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
        id: json['id'],
        sakit: json['sakit'],
        izin: json['izin'],
        alpha: json['alpha'],
        entryTime: json['entry_time'],
        isChanged: json['is_changed'],
        lecturerVerified: json['lecturer_verified'],
        precentage: json['precentage'],
      );
}
