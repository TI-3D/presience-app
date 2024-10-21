import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:presience_app/data/dto/requests/auth_dto.dart';
import 'package:presience_app/data/dto/requests/login_dto.dart';
import 'package:presience_app/data/dto/responses/auth_response.dart';
import 'package:presience_app/presentation/utils/constants.dart';

import '../local_datasources/auth_local_datasources.dart';

class AuthRemoteDatasource {
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
}
