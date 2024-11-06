import 'package:presience_app/domain/entities/user.dart';

class AuthDto {
  final String? token;
  final User? user;
  final DateTime? expiration;

  AuthDto({
    this.token,
    this.user,
    this.expiration,
  });

  factory AuthDto.fromJson(Map<String, dynamic> json) {
    final data = json["data"];

    DateTime? expirationDateTime;
    if (data["exp"] != null) {
      expirationDateTime =
          DateTime.fromMillisecondsSinceEpoch(data["exp"] * 1000);
    }

    if (data != null) {
      final userData = data["user"];
      final user = userData != null ? User.fromJson(userData) : null;

      return AuthDto(
        user: user,
        token: data["token"],
        expiration: expirationDateTime,
      );
    } else {
      return AuthDto(
        user: null,
        token: null,
        expiration: null,
      );
    }
  }

  Map<String, dynamic> toJson() => {
        "data": {
          "token": token,
          "user": user?.toJson(),
          "exp": expiration != null
              ? (expiration!.millisecondsSinceEpoch ~/ 1000)
              : null,
        },
      };
}
