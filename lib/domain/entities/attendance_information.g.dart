// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendanceInformationImpl _$$AttendanceInformationImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceInformationImpl(
      percentageAttendance: (json['percentageAttendance'] as num?)?.toInt(),
      sakit: (json['sakit'] as num?)?.toInt(),
      izin: (json['izin'] as num?)?.toInt(),
      alpha: (json['alpha'] as num?)?.toInt(),
      kompen: (json['kompen'] as num?)?.toInt(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$AttendanceInformationImplToJson(
        _$AttendanceInformationImpl instance) =>
    <String, dynamic>{
      'percentageAttendance': instance.percentageAttendance,
      'sakit': instance.sakit,
      'izin': instance.izin,
      'alpha': instance.alpha,
      'kompen': instance.kompen,
      'description': instance.description,
    };
