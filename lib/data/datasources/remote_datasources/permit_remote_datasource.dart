import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:presience_app/domain/entities/permit_detail.dart';

import '../../../domain/entities/schedule_week.dart';
import '../../../presentation/utils/constants.dart';
import '../local_datasources/auth_local_datasources.dart';

class PermitRemoteDatasource {
  Future<Either<String, List<PermitDetail>>> getHistoryPermit() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('$baseUrl/api/users/history-permit');
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
          jsonData.map((json) => PermitDetail.fromJson(json)).toList();
      return Right(schedules);
    } else {
      return Left(jsonDecode(response.body)['message']);
    }
  }

  Future<bool> downloadImage(String imageUrl) async {
    try {
      // Mendapatkan direktori penyimpanan lokal
      Directory directory = await getApplicationDocumentsDirectory();

      // Membuat nama file unik berdasarkan timestamp
      String fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
      String filePath = '${directory.path}/$fileName';

      // Mengunduh gambar dengan http
      final response = await http.get(Uri.parse(imageUrl));

      // Mengecek apakah status pengunduhan sukses
      if (response.statusCode == 200) {
        // Menyimpan gambar ke file lokal
        File file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);

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

  Future<Either<String, List<ScheduleWeek>>> getSchedulesDate() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('$baseUrl/api/users/schedule-date');
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
