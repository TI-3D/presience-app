// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      nim: json['nim'] as String?,
      name: json['name'] as String?,
      birthDate: json['birth_date'] as String?,
      gender: json['gender'] as String?,
      avatar: json['avatar'] as String?,
      major: json['major'] as String?,
      semester: (json['semester'] as num?)?.toInt(),
      isVerified: json['verified'] as bool?,
      group: json['group'] == null
          ? null
          : Group.fromJson(json['group'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'nim': instance.nim,
      'name': instance.name,
      'birth_date': instance.birthDate,
      'gender': instance.gender,
      'avatar': instance.avatar,
      'major': instance.major,
      'semester': instance.semester,
      'verified': instance.isVerified,
      'group': instance.group,
    };
