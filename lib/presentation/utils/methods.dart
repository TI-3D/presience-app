import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/labels/tag_label.dart';
import 'package:presience_app/presentation/widgets/modal/dialog.dart';

Map<String, dynamic> getWidgetStatus({
  required int izin,
  required int sakit,
  required int alpha,
  required int courseTime,
  bool isChanged = false,
}) {
  Widget? tagLabel;
  Icon? additionIcon;

  if (alpha == courseTime) {
    tagLabel = const CustomTaglabelRed(label: "Alpha");
    if (!isChanged) {
      additionIcon = const Icon(
        TablerIcons.alert_circle,
        color: redTheme,
        size: 16,
      );
    }
  } else if (izin == courseTime) {
    tagLabel = const CustomTaglabelOrange(label: "Izin");
    additionIcon = null;
  } else if (sakit == courseTime) {
    tagLabel = const CustomTaglabelOrange(label: "Sakit");
    additionIcon = null;
  } else if (izin == 0 && sakit == 0 && alpha == 0) {
    tagLabel = const CustomTaglabelGreen(label: "Hadir");
    additionIcon = null;
  } else if (alpha == 0 && (izin > 0 || sakit > 0)) {
    if (izin > 0 && izin < courseTime && sakit == 0) {
      tagLabel = const CustomTaglabelGreen(label: "Hadir");
    } else if (sakit > 0 && sakit < courseTime && izin == 0) {
      tagLabel = const CustomTaglabelGreen(label: "Hadir");
    }
    additionIcon = const Icon(
      TablerIcons.alarm,
      color: orangeTheme,
      size: 16,
    );
  } else if (alpha > 0 && alpha != courseTime) {
    tagLabel = const CustomTaglabelGreen(label: "Hadir");
    additionIcon = const Icon(
      TablerIcons.alert_circle,
      color: redTheme,
      size: 16,
    );
  }

  Map<String, dynamic> widgets = {
    'tagLabel': tagLabel!,
    'additionIcon': additionIcon,
  };

  return widgets;
}

String capitalize(String input) {
  if (input.isEmpty) return input;
  return input[0].toUpperCase() + input.substring(1).toLowerCase();
}

void showCustomDialog(
  BuildContext context, {
  bool isLoading = false,
  required CustomDialog child,
}) {
  showDialog(
    barrierDismissible: !isLoading,
    context: context,
    builder: (BuildContext context) {
      return child;
    },
  );
}

Future<XFile?> selectImage() async {
  XFile? selectedImage =
      await ImagePicker().pickImage(source: ImageSource.gallery);

  return selectedImage;
}

String getFormattedDate(DateTime date) {
  return DateFormat('yyyy/MM/dd').format(date);
}

String convertDateFormat(String dateString) {
  // Parse the original date string
  DateTime parsedDate = DateFormat('dd/MM/yyyy').parse(dateString);

  // Format the date in the desired format
  String formattedDate = DateFormat('yyyy/MM/dd').format(parsedDate);

  return formattedDate;
}

String convertToLongDateFormat(String dateString) {
  // Parse the original date string
  DateTime parsedDate = DateFormat('dd/MM/yyyy').parse(dateString);

  // Format the date in the desired long format
  String formattedDate = DateFormat('dd MMMM yyyy').format(parsedDate);

  return formattedDate;
}

String convertDateRequest(String date) {
  final DateFormat inputFormat = DateFormat('dd/MM/yyyy');
  final DateFormat outputFormat = DateFormat('yyyy-MM-dd');
  DateTime parsedDate = inputFormat.parse(date);
  return outputFormat.format(parsedDate);
}

Future<File> compressImage(File file) async {
  // Membaca gambar menggunakan paket image
  img.Image? image = img.decodeImage(file.readAsBytesSync());

  if (image == null) {
    throw Exception("Gambar gagal dibaca");
  }

  // Mengompres gambar (menentukan kualitas, misalnya 50%)
  img.Image compressedImage =
      img.copyResize(image, width: 800); // Mengubah ukuran jika perlu
  List<int> compressedBytes = img.encodeJpg(compressedImage,
      quality: 50); // Menyimpan dengan kualitas 50%

  // Menyimpan gambar terkompresi ke file sementara
  final tempDir = Directory.systemTemp;
  final tempFile = File('${tempDir.path}/temp_compressed.jpg');
  await tempFile.writeAsBytes(compressedBytes);

  return tempFile;
}
