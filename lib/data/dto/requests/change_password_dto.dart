class ChangePasswordDto {
  final String? password;
  final String? passwordConfirmation;

  ChangePasswordDto({
    this.password,
    this.passwordConfirmation,
  });

  Map<String, dynamic> toJson() => {
        "new_password": password,
        "new_password_confirmation": passwordConfirmation,
      };

  ChangePasswordDto copyWith({
    String? password,
    String? passwordConfirmation,
  }) {
    return ChangePasswordDto(
      password: password ?? this.password,
      passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
    );
  }
}
