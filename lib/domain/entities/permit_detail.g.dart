// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permit_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PermitDetailImpl _$$PermitDetailImplFromJson(Map<String, dynamic> json) =>
    _$PermitDetailImpl(
      id: (json['id'] as num?)?.toInt(),
      typePermission: json['typePermission'] as String?,
      status: json['status'] as String?,
      permit: json['permit'] == null
          ? null
          : Permit.fromJson(json['permit'] as Map<String, dynamic>),
      scheduleWeek: json['scheduleWeek'] == null
          ? null
          : ScheduleWeek.fromJson(json['scheduleWeek'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PermitDetailImplToJson(_$PermitDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'typePermission': instance.typePermission,
      'status': instance.status,
      'permit': instance.permit,
      'scheduleWeek': instance.scheduleWeek,
    };
