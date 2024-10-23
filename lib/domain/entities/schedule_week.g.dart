// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_week.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleWeekImpl _$$ScheduleWeekImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleWeekImpl(
      id: (json['id'] as num?)?.toInt(),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      isOnline: json['isOnline'] as bool?,
      status: json['status'] as String?,
      openedAt: json['openedAt'] as String?,
      closedAt: json['closedAt'] as String?,
      schedule: json['schedule'] == null
          ? null
          : Schedule.fromJson(json['schedule'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ScheduleWeekImplToJson(_$ScheduleWeekImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date?.toIso8601String(),
      'isOnline': instance.isOnline,
      'status': instance.status,
      'openedAt': instance.openedAt,
      'closedAt': instance.closedAt,
      'schedule': instance.schedule,
    };
