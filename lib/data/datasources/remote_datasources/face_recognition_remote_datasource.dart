import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../presentation/utils/constants.dart';
import '../../../presentation/utils/methods.dart';
import 'refresh_token_remote_datasource.dart';

class FaceRecognitionRemoteDatasource {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  )..interceptors.add(TokenInterceptor());

  Future<Either<String, String>> storeFace(File params) async {
    try {
      // Mengompres gambar
      final compressedFile = await compressImage(params);

      final formData = FormData.fromMap({
        'face_image': await MultipartFile.fromFile(compressedFile.path),
      });

      final response = await _dio.post(
        '/api/users/store-photo',
        data: formData,
      );

      if (response.statusCode == 200) {
        return Right(response.data['message'] as String);
      } else {
        return Left(response.data['message'] as String);
      }
    } on DioException catch (e) {
      return Left(e.response?.data['message'] ?? 'Jaringan anda kurang stabil');
    }
  }

  Future<Either<String, String>> validateFace(File params) async {
    try {
      // Mengompres gambar
      final compressedFile = await compressImage(params);

      final formData = FormData.fromMap({
        'face_image': await MultipartFile.fromFile(compressedFile.path),
      });

      final response = await _dio.post(
        '/api/users/face-recognition',
        data: formData,
      );

      if (response.statusCode == 200) {
        return Right(response.data['message'] as String);
      } else {
        return Left(response.data['message'] as String);
      }
    } on DioException catch (e) {
      return Left(e.response?.data['message'] ?? 'Jaringan anda kurang stabil');
    }
  }

  Future<Either<String, String>> validatePassword(String password) async {
    try {
      final response = await _dio.post(
        '/api/users/validate-password',
        data: {
          'password': password,
        },
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        return Right(response.data['message'] as String);
      } else {
        return Left(response.data['message'] as String);
      }
    } on DioException catch (e) {
      return Left(e.response?.data['message'] ?? 'Jaringan anda kurang stabil');
    }
  }
}
