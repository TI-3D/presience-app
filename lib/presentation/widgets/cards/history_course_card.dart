import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:presience_app/presentation/utils/methods.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/cards/card.dart';
import 'package:presience_app/presentation/widgets/labels/icon_label.dart';

class HistoryCourseCard extends StatelessWidget {
  final String courseName;
  final String date;
  final String openedTime;
  final String closedTime;
  final GestureTapCallback? onTap;
  final int izin;
  final int sakit;
  final int alpha;
  final int courseTime;
  final String courseWeek;
  final bool isChanged;

  const HistoryCourseCard({
    super.key,
    required this.courseName,
    this.onTap,
    required this.izin,
    required this.sakit,
    required this.alpha,
    required this.courseTime,
    required this.date,
    required this.openedTime,
    required this.courseWeek,
    required this.closedTime,
    required this.isChanged,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> widgets = getWidgetStatus(
      izin: izin,
      sakit: sakit,
      alpha: alpha,
      courseTime: courseTime,
      isChanged: isChanged,
    );

    return CustomCard(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widgets['tagLabel'],
              if (widgets['additionIcon'] != null) ...[
                const SizedBox(
                  width: 4,
                ),
                widgets['additionIcon'] ?? Container(),
              ],
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  courseName,
                  style: mediumBodyTextL,
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    CustomIconLabel(
                        label: 'Minggu ke-$courseWeek',
                        icon: TablerIcons.calendar,
                        color: neutralTheme[400]!),
                    const SizedBox(
                      width: 8,
                    ),
                    CustomIconLabel(
                        label: openedTime,
                        icon: TablerIcons.clock_play,
                        color: neutralTheme[400]!),
                    const SizedBox(
                      width: 8,
                    ),
                    CustomIconLabel(
                        label: closedTime,
                        icon: TablerIcons.clock_stop,
                        color: neutralTheme[400]!),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
