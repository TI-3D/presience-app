import 'package:presience_app/domain/entities/user.dart';

class AuthDto {
  final String? token;
  final User? user;

  AuthDto({
    this.token,
    this.user,
  });

  factory AuthDto.fromJson(Map<String, dynamic> json) {
    final data = json["data"];

    if (data != null) {
      final userData = data["user"];
      final user = userData != null ? User.fromJson(userData) : null;

      return AuthDto(
        user: user,
        token: data["token"],
      );
    } else {
      return AuthDto(
        user: null,
        token: null,
      );
    }
  }

  Map<String, dynamic> toJson() => {
        "data": {
          "token": token,
          "user": user?.toJson(),
        },
      };
}
