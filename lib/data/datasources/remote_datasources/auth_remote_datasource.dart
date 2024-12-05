import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:presience_app/data/dto/requests/auth_dto.dart';
import 'package:presience_app/data/dto/requests/change_password_dto.dart';
import 'package:presience_app/data/dto/requests/login_dto.dart';
import 'package:presience_app/data/dto/responses/auth_response.dart';
import 'package:presience_app/presentation/utils/constants.dart';

import '../local_datasources/auth_local_datasources.dart';
import 'refresh_token_remote_datasource.dart';

class AuthRemoteDatasource {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ),
  )..interceptors.add(TokenInterceptor());

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
    try {
      final response = await _dio.put(
        '/api/users/update-password',
        data: params.toJson(),
      );

      if (response.statusCode == 200) {
        return const Right('Yeay! Berhasil mengubah kata sandi');
      } else {
        return const Left(
            'Konfirmasi kata sandi salah atau minimal 8 karakter');
      }
    } on DioException {
      return const Left('Jaringan anda kurang stabil');
    }
  }

  Future<Either<String, String>> changeFcmId(String fcmId) async {
    try {
      final response = await _dio.put(
        '/api/users/update-fcmId',
        data: {'fcm_id': fcmId},
      );

      if (response.statusCode == 200) {
        return const Right('Yeay! Berhasil mengubah FCM ID');
      } else {
        return const Left(
            'Konfirmasi FCM ID salah atau FCM ID sudah digunakan');
      }
    } on DioException {
      return const Left('Jaringan anda kurang stabil');
    }
  }

  Future<void> refreshAccessToken() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final refreshToken = authData!.refToken;

    if (refreshToken == null) throw Exception("No refresh token available");

    final response = await http.post(
      Uri.parse('$baseUrl/api/users/reftoken'),
      body: {'reftoken': refreshToken},
    );

    if (response.statusCode == 200) {
      final authResponseModel =
          AuthResponse.fromJson(jsonDecode(response.body));
      await AuthLocalDataSource().saveAuthData(authResponseModel);
    } else {
      throw Exception('Failed to refresh token');
    }
  }
}
