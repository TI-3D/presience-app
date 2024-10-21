import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presience_app/domain/entities/group.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    String? nim,
    String? name,
    String? birthDate,
    String? gender,
    String? avatar,
    String? major,
    String? semester,
    bool? isVerified,
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
        group: Group.fromJson(json['group']),
      );
}
