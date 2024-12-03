import 'package:dio/dio.dart';
import 'package:presience_app/data/datasources/remote_datasources/auth_remote_datasource.dart';

import '../../dto/requests/auth_dto.dart';
import '../local_datasources/auth_local_datasources.dart';

class TokenInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    AuthDto? authData = await AuthLocalDataSource().getAuthData();
    final accessToken = authData!.token;
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      try {
        await AuthRemoteDatasource().refreshAccessToken();
        AuthDto? authData = await AuthLocalDataSource().getAuthData();
        final newAccessToken = authData!.token;
        if (newAccessToken != null) {
          err.requestOptions.headers['Authorization'] =
              'Bearer $newAccessToken';
          final cloneReq = await Dio().fetch(err.requestOptions);
          return handler.resolve(cloneReq);
        }
      } catch (e) {
        return handler.reject(err);
      }
    } else if (err.response?.statusCode == 500) {
      return handler.reject(err);
    } else {
      return handler.next(err);
    }
  }
}
