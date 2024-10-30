import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:presience_app/domain/entities/attendance_information.dart';

import '../../../presentation/utils/constants.dart';
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
}
