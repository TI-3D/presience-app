import 'package:presience_app/domain/entities/user.dart';

class AuthDto {
  final String? token;
  final User? user;

  AuthDto({
    this.token,
    this.user,
  });

  factory AuthDto.fromJson(Map<String, dynamic> json) {
    return AuthDto(
      user: User.fromJson(json["data"]["user"]),
      token: json["data"]["token"],
    );
  }

  Map<String, dynamic> toJson() => {
        "data": {
          "token": token,
          "user": user?.toJson(),
        },
      };
}
