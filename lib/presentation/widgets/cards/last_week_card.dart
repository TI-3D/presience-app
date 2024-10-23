// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:presience_app/presentation/utils/methods.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/widgets/cards/card.dart';

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
    Map<String, dynamic> widgets = getWidgetStatus(
        izin: izin, sakit: sakit, alpha: alpha, courseTime: courseTime);
    tagLabel = widgets['tagLabel']!;
    additionIcon = widgets['additionIcon'];

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
          Text(lectureName, style: regularBodyText)
        ],
      ),
    );
  }
}
