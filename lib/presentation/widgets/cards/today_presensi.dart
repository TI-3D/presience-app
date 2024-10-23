import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:presience_app/domain/entities/schedule_week.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/buttons/button.dart';
import 'package:presience_app/presentation/widgets/labels/icon_label.dart';
import 'package:presience_app/presentation/widgets/labels/tag_label.dart';

class TodayPresensiCard extends StatelessWidget {
  final ScheduleWeek scheduleWeek;
  final VoidCallback? onTapPresensi;
  final VoidCallback? onTapAjukanIzin;

  const TodayPresensiCard({
    super.key,
    required this.scheduleWeek,
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

    switch (scheduleWeek.status!) {
      case "closed":
        backgroundColor = neutralTheme;
        borderColor = neutralTheme[100]!;
        textColor = blackTheme;
        secondaryColor = neutralTheme[400]!;
        isAjukanEnable = true;
        isPresensiEnable = false;
        tagLabel = const CustomTaglabelGrey(label: "Belum Dibuka");
        break;
      case "opened":
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
                                scheduleWeek.schedule!.course!.name!,
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
                    scheduleWeek.schedule!.lecturer!.name!,
                    style: regularBodyTextXS.copyWith(color: textColor),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Opacity(
                opacity: scheduleWeek.status! == 'closed' ? 1 : 0.4,
                child: Row(
                  children: [
                    CustomIconLabel(
                        label: scheduleWeek.schedule!.room!.name!,
                        icon: TablerIcons.building,
                        color: secondaryColor),
                    const SizedBox(
                      width: 8,
                    ),
                    CustomIconLabel(
                        label: "Lantai ${scheduleWeek.schedule!.room!.floor!}",
                        icon: TablerIcons.stairs,
                        color: secondaryColor),
                    const SizedBox(
                      width: 8,
                    ),
                    CustomIconLabel(
                        label:
                            "${scheduleWeek.schedule!.startTime!}-${scheduleWeek.schedule!.endTime!}",
                        icon: TablerIcons.calendar_time,
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
