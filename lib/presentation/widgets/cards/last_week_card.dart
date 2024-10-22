import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/cards/card.dart';
import 'package:presience_app/presentation/widgets/labels/tag_label.dart';

class CustomLastWeekCard extends StatelessWidget {
  final String courseName;
  final String lectureName;
  final GestureTapCallback? onTap;
  final int izin;
  final int sakit;
  final int alpha;
  final int courseTime;

  CustomLastWeekCard(
      {super.key,
      required this.courseName,
      required this.lectureName,
      this.onTap,
      required this.izin,
      required this.alpha,
      required this.sakit,
      required this.courseTime});

  late Widget tagLabel;
  late Icon? additionIcon;

  @override
  Widget build(BuildContext context) {
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
    return CustomCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Text(
                courseName,
                style: mediumBodyTextL,
              )),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (additionIcon != null) ...[
                    additionIcon ?? Container(),
                    const SizedBox(
                      width: 4,
                    ),
                  ],
                  tagLabel,
                ],
              )
            ],
          ),
          Text(lectureName, style: regularBodyTextS)
        ],
      ),
    );
  }
}
