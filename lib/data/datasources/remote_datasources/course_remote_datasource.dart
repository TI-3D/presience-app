import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:presience_app/domain/entities/course.dart';

import '../../../presentation/utils/constants.dart';
import 'refresh_token_remote_datasource.dart';

class CourseRemoteDatasource {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ),
  )..interceptors.add(TokenInterceptor());

  Future<Either<String, List<Course>>> getCourses() async {
    try {
      final response = await _dio.get(
        '/api/users/schedule-id',
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = response.data['data'] as List<dynamic>;
        final courses = jsonData.map((json) => Course.fromJson(json)).toList();
        return Right(courses);
      } else {
        return Left(response.data['message'] as String);
      }
    } on DioException catch (e) {
      return Left(e.response?.data['message'] ?? 'Jaringan anda kurang stabil');
    }
  }
}
