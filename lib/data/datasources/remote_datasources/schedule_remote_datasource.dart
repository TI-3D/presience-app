import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:presience_app/data/dto/requests/attendance_dto.dart';
import 'package:presience_app/data/dto/requests/permit_dto.dart';
import 'package:presience_app/domain/entities/schedule_week.dart';

import '../../../presentation/utils/constants.dart';
import 'refresh_token_remote_datasource.dart';

class ScheduleRemoteDatasource {
  final _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  )..interceptors.add(TokenInterceptor());

  Future<Either<String, List<ScheduleWeek>>> getSchedulesToday() async {
    try {
      final response = await _dio.get('/api/users/schedule-week');

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = response.data['data'] as List<dynamic>;
        final schedules =
            jsonData.map((json) => ScheduleWeek.fromJson(json)).toList();
        return Right(schedules);
      } else {
        return Left(response.data['message'] as String);
      }
    } on DioException catch (e) {
      return Left(e.response?.data['message'] ?? 'An unknown error occurred');
    }
  }

  Future<Either<String, ScheduleWeek>> storeAttendance(
      AttendanceDto params) async {
    try {
      final formData = FormData.fromMap({
        'sw_id': params.scheduleWeekId.toString(),
        'latitude': params.latitude.toString(),
        'longitude': params.longitude.toString(),
        if (params.evidence != null)
          'evidence': await MultipartFile.fromFile(params.evidence!.path),
        if (params.description != null) 'description': params.description,
      });

      final response =
          await _dio.post('/api/users/store-attendance', data: formData);

      if (response.statusCode == 200) {
        return Right(ScheduleWeek.fromJson(response.data['data']));
      } else {
        return Left(response.data['message'] as String);
      }
    } on DioException catch (e) {
      return Left(e.response?.data['message'] ?? 'An unknown error occurred');
    }
  }

  Future<Either<String, ScheduleWeek>> storeCurrentPermit(
      PermitDto params) async {
    try {
      final formData = FormData.fromMap({
        'permit_type': params.type.toString(),
        'description': params.description.toString(),
        'sw_id': params.scheduleWeekId.toString(),
        if (params.evidence != null)
          'evidence': await MultipartFile.fromFile(params.evidence!.path),
      });

      final response =
          await _dio.post('/api/users/store-current-permit', data: formData);

      if (response.statusCode == 200) {
        return Right(ScheduleWeek.fromJson(response.data['data']));
      } else {
        return Left(response.data['message'] as String);
      }
    } on DioException catch (e) {
      return Left(e.response?.data['message'] ?? 'An unknown error occurred');
    }
  }
}
