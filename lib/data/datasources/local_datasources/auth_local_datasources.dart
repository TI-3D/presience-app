import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:presience_app/data/dto/requests/auth_dto.dart';
import 'package:presience_app/data/dto/responses/auth_response.dart';
import 'package:presience_app/domain/entities/group.dart';
import 'package:presience_app/domain/entities/user.dart';

class AuthLocalDataSource {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  Future<AuthDto> saveAuthData(AuthResponse authResponse) async {
    final Map<String, dynamic> decodedToken =
        JwtDecoder.decode(authResponse.token!);
    final user = User(
      nim: decodedToken['data']['nim'],
      name: decodedToken['data']['name'],
      birthDate: decodedToken['data']['birth_date'],
      gender: decodedToken['data']['gender'],
      avatar: decodedToken['data']['avatar'],
      major: decodedToken['data']['major'],
      semester: decodedToken['data']['semester'],
      isVerified: decodedToken['data']['verified'],
      group: Group.fromJson(decodedToken['data']['group']),
    );

    // Extract exp and convert it to DateTime
    final exp = decodedToken['exp'];
    DateTime? expirationDateTime;
    if (exp != null) {
      expirationDateTime = DateTime.fromMillisecondsSinceEpoch(exp * 1000);
    }

    final authData = AuthDto(
      token: authResponse.token,
      user: user,
      expiration: expirationDateTime,
    );

    // Save auth data securely
    await secureStorage.write(
      key: 'auth_data',
      value: jsonEncode(authData.toJson()),
    );
    return authData;
  }

  Future<void> removeAuthData() async {
    // Remove auth data from secure storage
    await secureStorage.delete(key: 'auth_data');
  }

  Future<AuthDto?> getAuthData() async {
    // Get auth data from secure storage
    final authData = await secureStorage.read(key: 'auth_data');
    if (authData != null) {
      return AuthDto.fromJson(jsonDecode(authData));
    } else {
      return null;
    }
  }

  Future<bool> isUserLoggedIn() async {
    // Check if user is logged in
    final authData = await secureStorage.read(key: 'auth_data');
    return authData != null;
  }
}
