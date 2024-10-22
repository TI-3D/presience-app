import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/buttons/button.dart';
import 'package:presience_app/presentation/widgets/labels/icon_label.dart';
import 'package:presience_app/presentation/widgets/labels/tag_label.dart';

class TodayPresensiCard extends StatelessWidget {
  final String courseName;
  final String lectureName;
  final String status;
  final String room;
  final String floor;
  final String startTime;
  final String endTime;
  final String absentPercentage;

  final VoidCallback? onTapPresensi;
  final VoidCallback? onTapAjukanIzin;

  const TodayPresensiCard({
    super.key,
    required this.courseName,
    required this.lectureName,
    required this.status,
    required this.room,
    required this.floor,
    required this.startTime,
    required this.endTime,
    required this.absentPercentage,
    this.onTapPresensi,
    this.onTapAjukanIzin,
  });

  @override
  Widget build(BuildContext context) {
    late Color backgroundColor;
    late Color secondaryColor;
    late Color borderColor;
    late Color textColor;
    late bool isPresensiEnable;
    late bool isAjukanEnable;
    late Widget tagLabel;

    switch (status) {
      case "nonActive":
        backgroundColor = neutralTheme;
        borderColor = neutralTheme[100]!;
        textColor = blackTheme;
        secondaryColor = neutralTheme[400]!;
        isAjukanEnable = true;
        isPresensiEnable = false;
        tagLabel = const CustomTaglabelGrey(label: "Belum Dibuka");
        break;
      case "active":
        backgroundColor = purpleTheme[50]!;
        borderColor = purpleTheme[200]!;
        textColor = purpleTheme;
        secondaryColor = purpleTheme;
        isAjukanEnable = true;
        isPresensiEnable = true;
        tagLabel = const CustomTaglabelPurple(label: "Dibuka");
        break;
      case "hadir":
        backgroundColor = greenTheme[50]!;
        borderColor = greenTheme[200]!;
        textColor = greenTheme;
        secondaryColor = greenTheme;
        isAjukanEnable = false;
        isPresensiEnable = false;
        tagLabel = const CustomTaglabelGreen(label: "Hadir");
        break;
      case "izin":
        backgroundColor = orangeTheme[50]!;
        borderColor = orangeTheme[200]!;
        textColor = orangeTheme;
        secondaryColor = orangeTheme;
        isAjukanEnable = false;
        isPresensiEnable = false;
        tagLabel = const CustomTaglabelOrange(label: "Izin");
      case "sakit":
        backgroundColor = orangeTheme[50]!;
        borderColor = orangeTheme[200]!;
        textColor = orangeTheme;
        secondaryColor = orangeTheme;
        isAjukanEnable = false;
        isPresensiEnable = false;
        tagLabel = const CustomTaglabelOrange(label: "Sakit");
        break;
      case "alpha":
        backgroundColor = redTheme[50]!;
        borderColor = redTheme[300]!;
        textColor = redTheme;
        secondaryColor = redTheme;
        isAjukanEnable = false;
        isPresensiEnable = true;
        tagLabel = const CustomTaglabelRed(label: "Alpha");
        break;
      default:
        backgroundColor = neutralTheme;
        borderColor = neutralTheme[100]!;
        textColor = blackTheme;
        secondaryColor = neutralTheme[400]!;
        isAjukanEnable = true;
        isPresensiEnable = false;
        tagLabel = const CustomTaglabelGrey(label: "-");
        break;
    }

    return Container(
      width: MediaQuery.of(context).size.width - 16,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(width: 1, color: borderColor)),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                TablerIcons.award_filled,
                                color: textColor,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                courseName,
                                style:
                                    mediumBodyTextL.copyWith(color: textColor),
                              )
                            ],
                          )),
                          tagLabel
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    lectureName,
                    style: regularBodyTextXS.copyWith(color: textColor),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Opacity(
                opacity: status == 'nonActive' ? 1 : 0.4,
                child: Row(
                  children: [
                    CustomIconLabel(
                        label: room,
                        icon: TablerIcons.building,
                        color: secondaryColor),
                    const SizedBox(
                      width: 8,
                    ),
                    CustomIconLabel(
                        label: "Lantai $floor",
                        icon: TablerIcons.stairs,
                        color: secondaryColor),
                    const SizedBox(
                      width: 8,
                    ),
                    CustomIconLabel(
                        label: "$startTime-$endTime",
                        icon: TablerIcons.calendar_time,
                        color: secondaryColor),
                    const SizedBox(
                      width: 8,
                    ),
                    CustomIconLabel(
                        label: "$absentPercentage%",
                        icon: TablerIcons.chart_pie,
                        color: secondaryColor),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Column(
            children: [
              SmallFillButton(
                label: "Presensi",
                onPressed: onTapPresensi ?? () {},
                isDisabled: !isPresensiEnable,
              ),
              const SizedBox(
                height: 8,
              ),
              SmallTextButton(
                label: "Ajukan Izin",
                onPressed: onTapAjukanIzin ?? () {},
                isDisabled: !isAjukanEnable,
              ),
            ],
          )
        ],
      ),
    );
  }
}
