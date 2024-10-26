import 'package:flutter/material.dart';
import 'package:presience_app/presentation/utils/text.dart';

const MaterialColor neutralTheme = MaterialColor(
  0xFFFFFFFF,
  <int, Color>{
    50: Color(0xFFF6F6F6),
    100: Color(0xFFE7E7E7),
    200: Color(0xFFD1D1D1),
    300: Color(0xFFB0B0B0),
    400: Color(0xFF888888),
    500: Color(0xFF6D6D6D),
    600: Color(0xFF5D5D5D),
    700: Color(0xFF4F4F4F),
    800: Color(0xFF454545),
    900: Color(0xFF3D3D3D),
  },
);

const MaterialColor purpleTheme = MaterialColor(
  0xFF2B2464,
  <int, Color>{
    50: Color(0xFFEEF1FF),
    100: Color(0xFFE0E6FF),
    200: Color(0xFFC7CFFE),
    300: Color(0xFFA5B0FC),
    400: Color(0xFF8186F8),
    500: Color(0xFF6763F1),
    600: Color(0xFF5646E5),
    700: Color(0xFF4A38CA),
    800: Color(0xFF3C30A3),
    900: Color(0xFF352E81),
    950: Color(0xFF2B2464),
  },
);

const MaterialColor redTheme = MaterialColor(
  0xFFCB3A31,
  <int, Color>{
    50: Color(0xFFFDF4F3),
    100: Color(0xFFFCE5E4),
    200: Color(0xFFFAD1CE),
    300: Color(0xFFF5B0AC),
    400: Color(0xFFEE827B),
    500: Color(0xFFE25951),
    600: Color(0xFFCB3A31),
    700: Color(0xFFAD3028),
    800: Color(0xFF8F2B25),
    900: Color(0xFF772A25),
    950: Color(0xFF40120F),
  },
);

const MaterialColor greenTheme = MaterialColor(
  0xFF43936C,
  <int, Color>{
    50: Color(0xFFF1F8F4),
    100: Color(0xFFDCEFE2),
    200: Color(0xFFBCDEC9),
    300: Color(0xFF90C5A8),
    400: Color(0xFF60A782),
    500: Color(0xFF43936C),
    600: Color(0xFF2D6E50),
    700: Color(0xFF245841),
    800: Color(0xFF1F4635),
    900: Color(0xFF1A3A2D),
    950: Color(0xFF0E2019),
  },
);

const MaterialColor orangeTheme = MaterialColor(
  0xFFC4631B,
  <int, Color>{
    50: Color(0xFFFDF8ED),
    100: Color(0xFFF9EBCC),
    200: Color(0xFFF2D495),
    300: Color(0xFFEBBA5E),
    400: Color(0xFFE6A239),
    500: Color(0xFFD57D20),
    600: Color(0xFFC4631B),
    700: Color(0xFFA3451A),
    800: Color(0xFF85371B),
    900: Color(0xFF6E2E19),
    950: Color(0xFF3E160A),
  },
);

const Color blackTheme = Color(0xFF1B1B1B);

final Color modalBackground = blackTheme.withOpacity(0.4);

final ThemeData appTheme = ThemeData(
    fontFamily: typeFace,
    primarySwatch: purpleTheme, // Atur primarySwatch ke warna purpleTheme
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch:
          purpleTheme, // Gunakan MaterialColor purple sebagai primarySwatch
    ).copyWith(
      inversePrimary: Colors.white,
      secondary: purpleTheme[400], // Sesuaikan warna sekunder (accent)
      surface: purpleTheme[50], // Warna background
      onPrimary: Colors.white, // Warna teks di atas primary
      onSecondary: Colors.white, // Warna teks di atas secondary
    ));
