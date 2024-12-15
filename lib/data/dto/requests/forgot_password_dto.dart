class ForgotPasswordDto {
  final String? nim;
  final String? birthDate;

  const ForgotPasswordDto({
    this.nim,
    this.birthDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'nim': nim,
      'birth_date': birthDate,
    };
  }

  ForgotPasswordDto copyWith({
    String? nim,
    String? birthDate,
  }) {
    return ForgotPasswordDto(
      nim: nim ?? this.nim,
      birthDate: birthDate ?? this.birthDate,
    );
  }
}
