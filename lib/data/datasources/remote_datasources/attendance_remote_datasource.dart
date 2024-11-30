import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:presience_app/data/dto/requests/get_schedule_dto.dart';
import 'package:presience_app/data/dto/requests/permit_before_schedule_dto.dart';
import 'package:presience_app/domain/entities/attendance_information.dart';
import 'package:presience_app/domain/entities/schedule_week.dart';
import 'package:presience_app/presentation/utils/methods.dart';

import '../../../presentation/utils/constants.dart';
import '../../dto/requests/get_history_attendance_dto.dart';
import '../local_datasources/auth_local_datasources.dart';

class AttendanceRemoteDatasource {
  Future<Either<String, AttendanceInformation>>
      getAttendanceInformation() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('$baseUrl/api/users/attendance-information');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ${authData!.token}',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return Right(
          AttendanceInformation.fromJson(jsonDecode(response.body)['data']));
    } else {
      return Left(jsonDecode(response.body)['message']);
    }
  }

  Future<Either<String, List<ScheduleWeek>>> getHistoryAttendanceWeek() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('$baseUrl/api/users/history-week');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ${authData!.token}',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData =
          jsonDecode(response.body)['data'] as List<dynamic>;
      final schedules =
          jsonData.map((json) => ScheduleWeek.fromJson(json)).toList();
      return Right(schedules);
    } else {
      return Left(jsonDecode(response.body)['message']);
    }
  }

  Future<Either<String, List<ScheduleWeek>>> getSchedulesByDate(
      GetScheduleDto params) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse(
        '$baseUrl/api/users/schedule-date?start_date=${convertDateFormat(params.startDate!)}&end_date=${convertDateFormat(params.endDate!)}');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ${authData!.token}',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData =
          jsonDecode(response.body)['data'] as List<dynamic>;
      final schedules =
          jsonData.map((json) => ScheduleWeek.fromJson(json)).toList();
      return Right(schedules);
    } else {
      return Left(jsonDecode(response.body)['message']);
    }
  }

  Future<Either<String, List<ScheduleWeek>>> getHistoryAttendance(
      GetHistoryAttendanceDto params) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse(
        '$baseUrl/api/users/history?course_id=${params.courseId.toString()}&attendance_status=${params.attendanceStatus}');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer ${authData!.token}',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData =
          jsonDecode(response.body)['data'] as List<dynamic>;
      final schedules =
          jsonData.map((json) => ScheduleWeek.fromJson(json)).toList();
      return Right(schedules);
    } else {
      return Left(jsonDecode(response.body)['message']);
    }
  }

  Future<Either<String, void>> storePermitBeforeSchedule(
      PermitBeforeScheduleDto params) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('$baseUrl/api/users/store-before-schedule');

    final request = http.MultipartRequest('POST', url)
      ..headers['Authorization'] = 'Bearer ${authData!.token}'
      ..fields['permit_type'] = params.type.toString()
      ..fields['description'] = params.description.toString()
      ..fields['start_date'] = params.startDate!.toString()
      ..fields['end_date'] = params.endDate!.toString();

    request.fields['sw_id'] = params.scheduleWeekId!.toString();

    // Attach the evidence file if it exists
    if (params.evidence != null) {
      request.files.add(
        await http.MultipartFile.fromPath('evidence', params.evidence!.path),
      );
    }

    try {
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        return const Right(null);
      } else {
        return Left(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      return Left('An error occurred: $e');
    }
  }
}
