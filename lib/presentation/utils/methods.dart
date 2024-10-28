import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:presience_app/presentation/pages/home/homepage.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/buttons/button.dart';
import 'package:presience_app/presentation/widgets/labels/tag_label.dart';
import 'package:presience_app/presentation/widgets/modal/dialog.dart';

Map<String, dynamic> getWidgetStatus(
    {required int izin,
    required int sakit,
    required int alpha,
    required int courseTime}) {
  Widget? tagLabel;
  Icon? additionIcon;

  if (alpha == courseTime) {
    tagLabel = const CustomTaglabelRed(label: "Alpha");
    additionIcon = const Icon(
      TablerIcons.alert_circle,
      color: redTheme,
      size: 16,
    );
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

void showCustomDialog(BuildContext context,
    {bool isLoading = false,
    required CustomDialog child,
    Future<bool> Function()? getResponse,
    void Function(bool response)? onResponse}) {
  showDialog(
    barrierDismissible: !isLoading,
    context: context,
    builder: (BuildContext context) {
      return child;
    },
  );

  // Simulate a backend call
  if (isLoading) {
    getResponse!().then((response) {
      onResponse!(response);
    });
  }
}
