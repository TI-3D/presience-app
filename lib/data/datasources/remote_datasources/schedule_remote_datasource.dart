import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
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
}
