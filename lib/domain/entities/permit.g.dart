// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PermitImpl _$$PermitImplFromJson(Map<String, dynamic> json) => _$PermitImpl(
      id: (json['id'] as num?)?.toInt(),
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      description: json['description'] as String?,
      evidence: json['evidence'] as String?,
    );

Map<String, dynamic> _$$PermitImplToJson(_$PermitImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'description': instance.description,
      'evidence': instance.evidence,
    };
