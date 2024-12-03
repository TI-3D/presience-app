class AuthResponse {
  final String? token;
  final String? refToken;
  final int? expiredIn;

  AuthResponse({
    this.token,
    this.refToken,
    this.expiredIn,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    // get data from json["data"]
    final data = json["data"];

    if (data != null) {
      // if data is not null, get token from data
      return AuthResponse(
        token: data["token"],
        refToken: data["reftoken"],
        expiredIn: data["expired_in"],
      );
    } else {
      return AuthResponse(
        token: null,
        refToken: null,
        expiredIn: null,
      );
    }
  }

  Map<String, dynamic> toJson() => {
        "data": {
          "token": token,
          "reftoken": refToken,
          "expired_in": expiredIn,
        },
      };
}
