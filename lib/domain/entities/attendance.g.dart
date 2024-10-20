// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendanceImpl _$$AttendanceImplFromJson(Map<String, dynamic> json) =>
    _$AttendanceImpl(
      id: (json['id'] as num?)?.toInt(),
      sakit: (json['sakit'] as num?)?.toInt(),
      izin: (json['izin'] as num?)?.toInt(),
      alpha: (json['alpha'] as num?)?.toInt(),
      entryTime: json['entryTime'] as String?,
      isChanged: json['isChanged'] as bool?,
      lecturerVerified: json['lecturerVerified'] as bool?,
      scheduleWeek: json['scheduleWeek'] == null
          ? null
          : ScheduleWeek.fromJson(json['scheduleWeek'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AttendanceImplToJson(_$AttendanceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sakit': instance.sakit,
      'izin': instance.izin,
      'alpha': instance.alpha,
      'entryTime': instance.entryTime,
      'isChanged': instance.isChanged,
      'lecturerVerified': instance.lecturerVerified,
      'scheduleWeek': instance.scheduleWeek,
    };
