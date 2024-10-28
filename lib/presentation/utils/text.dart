import 'package:flutter/material.dart';
import 'package:presience_app/presentation/utils/theme.dart';

double calculateWordSpacing(dynamic fontSize) {
  // return -(fontSize * 0.02);
  return 0;
}

const String typeFace = "InterTight";

const Map<String, FontWeight> fontWeight = {
  "Regular": FontWeight.w400,
  "Medium": FontWeight.w500,
  "SemiBold": FontWeight.w600
};

TextStyle heading1 = TextStyle(
  fontFamily: typeFace,
  color: blackTheme,
  fontWeight: fontWeight["Medium"],
  fontSize: 32,
  wordSpacing: calculateWordSpacing(32),
);

TextStyle heading2 = TextStyle(
  fontFamily: typeFace,
  color: blackTheme,
  fontWeight: fontWeight["Medium"],
  fontSize: 28,
  wordSpacing: calculateWordSpacing(28),
);

TextStyle heading3 = TextStyle(
  fontFamily: typeFace,
  color: blackTheme,
  fontWeight: fontWeight["Medium"],
  fontSize: 24,
  wordSpacing: calculateWordSpacing(24),
);

TextStyle regularBodyTextXL = TextStyle(
  fontFamily: typeFace,
  color: blackTheme,
  fontWeight: fontWeight["Regular"],
  fontSize: 20,
  wordSpacing: calculateWordSpacing(20),
);

TextStyle regularBodyTextL = TextStyle(
  fontFamily: typeFace,
  color: blackTheme,
  fontWeight: fontWeight["Regular"],
  fontSize: 18,
  wordSpacing: calculateWordSpacing(18),
);

TextStyle regularBodyText = TextStyle(
  fontFamily: typeFace,
  color: blackTheme,
  fontWeight: fontWeight["Regular"],
  fontSize: 16,
  wordSpacing: calculateWordSpacing(16),
);

TextStyle regularBodyTextS = TextStyle(
  fontFamily: typeFace,
  color: blackTheme,
  fontWeight: fontWeight["Regular"],
  fontSize: 14,
  wordSpacing: calculateWordSpacing(14),
);

TextStyle regularBodyTextXS = TextStyle(
  fontFamily: typeFace,
  color: blackTheme,
  fontWeight: fontWeight["Regular"],
  fontSize: 12,
  wordSpacing: calculateWordSpacing(12),
);

TextStyle mediumBodyTextXL = TextStyle(
  fontFamily: typeFace,
  color: blackTheme,
  fontWeight: fontWeight["Medium"],
  fontSize: 20,
  wordSpacing: calculateWordSpacing(20),
);

TextStyle mediumBodyTextL = TextStyle(
  fontFamily: typeFace,
  color: blackTheme,
  fontWeight: fontWeight["Medium"],
  fontSize: 18,
  wordSpacing: calculateWordSpacing(18),
);

TextStyle mediumBodyText = TextStyle(
  fontFamily: typeFace,
  color: blackTheme,
  fontWeight: fontWeight["Medium"],
  fontSize: 16,
  wordSpacing: calculateWordSpacing(16),
);

TextStyle mediumBodyTextS = TextStyle(
  fontFamily: typeFace,
  color: blackTheme,
  fontWeight: fontWeight["Medium"],
  fontSize: 14,
  wordSpacing: calculateWordSpacing(14),
);

TextStyle mediumBodyTextXS = TextStyle(
  fontFamily: typeFace,
  color: blackTheme,
  fontWeight: fontWeight["Medium"],
  fontSize: 12,
  wordSpacing: calculateWordSpacing(12),
);

TextStyle regularSmallText = TextStyle(
  fontFamily: typeFace,
  color: blackTheme,
  fontWeight: fontWeight["Regular"],
  fontSize: 11,
  wordSpacing: calculateWordSpacing(11),
);

TextStyle mediumSmallText = TextStyle(
  fontFamily: typeFace,
  color: blackTheme,
  fontWeight: fontWeight["Medium"],
  fontSize: 11,
  wordSpacing: calculateWordSpacing(11),
);
