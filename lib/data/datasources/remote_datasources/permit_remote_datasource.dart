import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:presience_app/domain/entities/permit_detail.dart';

import '../../../presentation/utils/constants.dart';
import 'refresh_token_remote_datasource.dart';

class PermitRemoteDatasource {
  final _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  )..interceptors.add(TokenInterceptor());

  Future<Either<String, List<PermitDetail>>> getHistoryPermit() async {
    try {
      final response = await _dio.get('/api/users/history-permit');

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = response.data['data'] as List<dynamic>;
        final permits =
            jsonData.map((json) => PermitDetail.fromJson(json)).toList();
        return Right(permits);
      } else {
        return Left(response.data['message'] as String);
      }
    } on DioException catch (e) {
      return Left(e.response?.data['message'] ?? 'An unknown error occurred');
    }
  }

  Future<bool> downloadImage(String imageUrl) async {
    try {
      // Mendapatkan direktori penyimpanan lokal
      Directory directory = await getApplicationDocumentsDirectory();

      // Membuat nama file unik berdasarkan timestamp
      String fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
      String filePath = '${directory.path}/$fileName';

      // Mengunduh gambar dengan Dio
      final response = await _dio.get<List<int>>(
        imageUrl,
        options: Options(
          responseType: ResponseType.bytes, // Mendapatkan data sebagai bytes
        ),
      );

      // Mengecek apakah status pengunduhan sukses
      if (response.statusCode == 200) {
        // Menyimpan gambar ke file lokal
        File file = File(filePath);
        await file.writeAsBytes(response.data!);

        print("Gambar berhasil diunduh dan disimpan di: $filePath");
        return true;
      } else {
        print("Gagal mengunduh gambar. Status: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print("Gagal mengunduh gambar: $e");
      return false;
    }
  }
}
