import 'dart:convert';

import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:presience_app/data/dto/requests/auth_dto.dart';
import 'package:presience_app/data/dto/responses/auth_response.dart';
import 'package:presience_app/domain/entities/group.dart';
import 'package:presience_app/domain/entities/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSource {
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

    final authData = AuthDto(
      token: authResponse.token,
      user: user,
    );

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_data', jsonEncode(authData.toJson()));
    return authData;
  }

  Future<void> removeAuthData() async {
    // Remove auth data from local storage
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_data');
  }

  Future<AuthDto?> getAuthData() async {
    // Get auth data from local storage
    final prefs = await SharedPreferences.getInstance();
    final authData = prefs.getString('auth_data');
    if (authData != null) {
      return AuthDto.fromJson(jsonDecode(authData));
    } else {
      return null;
    }
  }

  Future<bool> isUserLoggedIn() async {
    // Check if user is logged in
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('auth_data');
  }
}
