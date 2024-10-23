class AuthResponse {
  final String? token;
  final int? expiredIn;

  AuthResponse({
    this.token,
    this.expiredIn,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    // get data from json["data"]
    final data = json["data"];

    if (data != null) {
      // if data is not null, get token from data
      return AuthResponse(
        token: data["token"],
        expiredIn: data["expired_in"],
      );
    } else {
      return AuthResponse(
        token: null,
        expiredIn: null,
      );
    }
  }

  Map<String, dynamic> toJson() => {
        "data": {
          "token": token,
          "expired_in": expiredIn,
        },
      };
}
