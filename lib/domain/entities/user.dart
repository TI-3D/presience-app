// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presience_app/domain/entities/group.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    String? nim,
    String? name,
    @JsonKey(name: 'birth_date') String? birthDate,
    String? gender,
    String? avatar,
    String? major,
    int? semester,
    @JsonKey(name: 'verified') bool? isVerified,
    Group? group,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => User(
        nim: json['nim'],
        name: json['name'],
        birthDate: json['birth_date'],
        gender: json['gender'],
        avatar: json['avatar'],
        major: json['major'],
        semester: json['semester'],
        isVerified: json['verified'],
        group: json['group'] != null ? Group.fromJson(json['group']) : null,
      );

  @override
  Map<String, dynamic> toJson() {
    return {
      'nim': nim,
      'name': name,
      'birth_date': birthDate,
      'gender': gender,
      'avatar': avatar,
      'major': major,
      'semester': semester,
      'verified': isVerified,
      'group': group?.toJson(),
    };
  }
}
