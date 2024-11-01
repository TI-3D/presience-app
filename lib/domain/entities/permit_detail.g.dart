// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permit_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PermitDetailImpl _$$PermitDetailImplFromJson(Map<String, dynamic> json) =>
    _$PermitDetailImpl(
      id: (json['id'] as num?)?.toInt(),
      status: json['status'] as String?,
      permit: json['permit'] == null
          ? null
          : Permit.fromJson(json['permit'] as Map<String, dynamic>),
      scheduleWeek: json['scheduleWeek'] == null
          ? null
          : ScheduleWeek.fromJson(json['scheduleWeek'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$PermitDetailImplToJson(_$PermitDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'permit': instance.permit,
      'scheduleWeek': instance.scheduleWeek,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
