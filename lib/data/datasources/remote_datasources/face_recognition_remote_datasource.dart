import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../presentation/utils/constants.dart';
import '../local_datasources/auth_local_datasources.dart';

class FaceRecognitionRemoteDatasource {
  Future<Either<String, String>> storeFace(File params) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('$baseUrl/api/users/store-photo');

    final request = http.MultipartRequest('POST', url)
      ..headers['Authorization'] = 'Bearer ${authData!.token}';

    request.files.add(
      await http.MultipartFile.fromPath('face_image', params.path),
    );

    try {
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        return Right(jsonDecode(response.body)['message'] as String);
      } else {
        return Left(jsonDecode(response.body)['message'] as String);
      }
    } catch (e) {
      return Left('An error occurred: $e');
    }
  }

  Future<Either<String, String>> validateFace(File params) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('$baseUrl/api/users/face-recognition');

    final request = http.MultipartRequest('POST', url)
      ..headers['Authorization'] = 'Bearer ${authData!.token}';

    request.files.add(
      await http.MultipartFile.fromPath('face_image', params.path),
    );

    try {
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        return Right(jsonDecode(response.body)['message'] as String);
      } else {
        return Left(jsonDecode(response.body)['message'] as String);
      }
    } catch (e) {
      return Left('An error occurred: $e');
    }
  }

  Future<Either<String, String>> validatePassword(String password) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('$baseUrl/api/users/validate-password');
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer ${authData!.token}',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return Right(jsonDecode(response.body)['message'] as String);
    } else {
      return Left(jsonDecode(response.body)['message'] as String);
    }
  }
}
