class LoginDto {
  final String? nim;
  final String? password;

  const LoginDto({
    this.nim,
    this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': nim,
      'password': password,
    };
  }

  LoginDto copyWith({
    String? nim,
    String? password,
  }) {
    return LoginDto(
      nim: nim ?? this.nim,
      password: password ?? this.password,
    );
  }
}
