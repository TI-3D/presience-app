import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:presience_app/data/dto/requests/auth_dto.dart';
import 'package:presience_app/data/dto/requests/change_password_dto.dart';
import 'package:presience_app/data/dto/requests/login_dto.dart';
import 'package:presience_app/data/dto/responses/auth_response.dart';
import 'package:presience_app/presentation/utils/constants.dart';

import '../local_datasources/auth_local_datasources.dart';

class AuthRemoteDatasource {
  Future<Either<String, AuthDto>> login(LoginDto params) async {
    final url = Uri.parse('$baseUrl/api/users/login');
    final response = await http.post(
      url,
      body: params.toJson(),
    );

    if (response.statusCode == 200) {
      final authResponseModel =
          AuthResponse.fromJson(jsonDecode(response.body));
      final data = await AuthLocalDataSource().saveAuthData(authResponseModel);
      return Right(data);
    } else {
      return const Left('Nim atau kata sandi salah');
    }
  }

  Future<Either<String, String>> changePassword(
      ChangePasswordDto params) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('$baseUrl/api/users/update-password');
    final response = await http.put(
      url,
      body: jsonEncode(params.toJson()),
      headers: {
        'Authorization': 'Bearer ${authData!.token}',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return const Right('Yeay! Berhasil mengubah kata sandi');
    } else {
      return const Left('Konfirmasi kata sandi salah atau minimal 8 karakter');
    }
  }

  Future<Either<String, String>> changeFcmId(String fcmId) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('$baseUrl/api/users/update-fcmId');
    final response = await http.put(
      url,
      body: jsonEncode({
        'fcm_id': fcmId,
      }),
      headers: {
        'Authorization': 'Bearer ${authData!.token}',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return const Right('Yeay! Berhasil mengubah FCM ID');
    } else {
      return const Left('Konfirmasi FCM ID salah atau FCM ID sudah digunakan');
    }
  }
}
