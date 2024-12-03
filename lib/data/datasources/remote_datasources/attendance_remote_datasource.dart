import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:presience_app/data/dto/requests/get_history_attendance_dto.dart';
import 'package:presience_app/data/dto/requests/get_schedule_dto.dart';
import 'package:presience_app/data/dto/requests/permit_before_schedule_dto.dart';
import 'package:presience_app/domain/entities/attendance_information.dart';
import 'package:presience_app/domain/entities/schedule_week.dart';
import 'package:presience_app/presentation/utils/constants.dart';
import 'package:presience_app/presentation/utils/methods.dart';

import 'refresh_token_remote_datasource.dart';

class AttendanceRemoteDatasource {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  )..interceptors.add(TokenInterceptor());

  Future<Either<String, AttendanceInformation>>
      getAttendanceInformation() async {
    try {
      final response = await _dio.get('/api/users/attendance-information');
      if (response.statusCode == 200) {
        return Right(AttendanceInformation.fromJson(response.data['data']));
      } else {
        return Left(response.data['message']);
      }
    } on DioException catch (e) {
      return Left(e.response?.data['message'] ?? 'Kesalahan jaringan');
    }
  }

  Future<Either<String, List<ScheduleWeek>>> getHistoryAttendanceWeek() async {
    try {
      final response = await _dio.get('/api/users/history-week');
      if (response.statusCode == 200) {
        final schedules = (response.data['data'] as List)
            .map((json) => ScheduleWeek.fromJson(json))
            .toList();
        return Right(schedules);
      } else {
        return Left(response.data['message']);
      }
    } on DioException catch (e) {
      return Left(e.response?.data['message'] ?? 'Kesalahan jaringan');
    }
  }

  Future<Either<String, List<ScheduleWeek>>> getSchedulesByDate(
      GetScheduleDto params) async {
    final queryParameters = {
      'start_date': convertDateFormat(params.startDate!),
      'end_date': convertDateFormat(params.endDate!),
    };
    try {
      final response = await _dio.get(
        '/api/users/schedule-date',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        final schedules = (response.data['data'] as List)
            .map((json) => ScheduleWeek.fromJson(json))
            .toList();
        return Right(schedules);
      } else {
        return Left(response.data['message']);
      }
    } on DioException catch (e) {
      return Left(e.response?.data['message'] ?? 'Kesalahan jaringan');
    }
  }

  Future<Either<String, List<ScheduleWeek>>> getHistoryAttendance(
      GetHistoryAttendanceDto params) async {
    final queryParameters = {
      'course_id': params.courseId.toString(),
      'attendance_status': params.attendanceStatus,
    };
    try {
      final response = await _dio.get(
        '/api/users/history',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        final schedules = (response.data['data'] as List)
            .map((json) => ScheduleWeek.fromJson(json))
            .toList();
        return Right(schedules);
      } else {
        return Left(response.data['message']);
      }
    } on DioException catch (e) {
      return Left(e.response?.data['message'] ?? 'Kesalahan jaringan');
    }
  }

  Future<Either<String, void>> storePermitBeforeSchedule(
      PermitBeforeScheduleDto params) async {
    final formData = FormData.fromMap({
      'permit_type': params.type.toString(),
      'description': params.description.toString(),
      'start_date': params.startDate!.toString(),
      'end_date': params.endDate!.toString(),
      'sw_id': params.scheduleWeekId!.toString(),
      if (params.evidence != null)
        'evidence': await MultipartFile.fromFile(params.evidence!.path),
    });

    try {
      final response = await _dio.post(
        '/api/users/store-before-schedule',
        data: formData,
      );
      if (response.statusCode == 200) {
        return const Right(null);
      } else {
        return Left(response.data['message']);
      }
    } on DioException catch (e) {
      return Left(e.response?.data['message'] ?? 'Kesalahan jaringan');
    }
  }
}
