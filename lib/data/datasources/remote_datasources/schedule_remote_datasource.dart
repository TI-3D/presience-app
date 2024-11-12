import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:presience_app/data/dto/requests/attendance_dto.dart';
import 'package:presience_app/data/dto/requests/permit_dto.dart';
import 'package:presience_app/domain/entities/schedule_week.dart';

import '../../../presentation/utils/constants.dart';
import '../local_datasources/auth_local_datasources.dart';

class ScheduleRemoteDatasource {
  Future<Either<String, List<ScheduleWeek>>> getSchedulesToday() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('$baseUrl/api/users/schedule-week');
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

  Future<Either<String, ScheduleWeek>> storeAttendance(
      AttendanceDto params) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('$baseUrl/api/users/store-attendance');

    final request = http.MultipartRequest('POST', url)
      ..headers['Authorization'] = 'Bearer ${authData!.token}'
      ..fields['description'] = params.description ?? '-'
      ..fields['sw_id'] = params.scheduleWeekId.toString()
      ..fields['latitude'] = params.latitude.toString()
      ..fields['longitude'] = params.longitude.toString();

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
        return Right(ScheduleWeek.fromJson(jsonDecode(response.body)['data']));
      } else {
        return Left(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      return Left('An error occurred: $e');
    }
  }

  Future<Either<String, ScheduleWeek>> storeCurrentPermit(
      PermitDto params) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('$baseUrl/api/users/store-current-permit');

    final request = http.MultipartRequest('POST', url)
      ..headers['Authorization'] = 'Bearer ${authData!.token}'
      ..fields['permit_type'] = params.type ?? '-'
      ..fields['description'] = params.description ?? '-'
      ..fields['sw_id'] = params.scheduleWeekId.toString();

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
        return Right(ScheduleWeek.fromJson(jsonDecode(response.body)['data']));
      } else {
        return Left(jsonDecode(response.body)['message']);
      }
    } catch (e) {
      return Left('An error occurred: $e');
    }
  }
}
