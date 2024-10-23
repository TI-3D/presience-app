import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:presience_app/presentation/utils/methods.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/cards/card.dart';
import 'package:presience_app/presentation/widgets/labels/icon_label.dart';
import 'package:presience_app/presentation/widgets/labels/tag_label.dart';

class HistoryPresensiCard extends StatelessWidget {
  final String courseName;
  final String date;
  final String openedTime;
  final String closedTime;
  final GestureTapCallback? onTap;
  final int izin;
  final int sakit;
  final int alpha;
  final int courseTime;

  const HistoryPresensiCard(
      {super.key,
      required this.courseName,
      this.onTap,
      required this.izin,
      required this.sakit,
      required this.alpha,
      required this.courseTime,
      required this.date,
      required this.openedTime,
      required this.closedTime});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> widgets = getWidgetStatus(
        izin: izin, sakit: sakit, alpha: alpha, courseTime: courseTime);

    return CustomCard(
      child: GestureDetector(
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
            SizedBox(
              height: 6,
            ),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    courseName,
                    style: mediumBodyTextL,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      CustomIconLabel(
                          label: date,
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
      ),
    );
  }
}
