import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:presience_app/presentation/utils/methods.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/cards/card.dart';
import 'package:presience_app/presentation/widgets/labels/icon_label.dart';
import 'package:presience_app/presentation/widgets/labels/tag_label.dart';

class PerizinanPresensiCard extends StatelessWidget {
  final String courseName;
  final String lectureName;
  final String date;
  final GestureTapCallback? onTap;
  final String typePermission;

  const PerizinanPresensiCard({
    super.key,
    required this.courseName,
    required this.lectureName,
    this.onTap,
    required this.date,
    required this.typePermission,
  }) : assert(typePermission == "izin" || typePermission == "sakit");

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTaglabelOrange(label: capitalize(typePermission)),
                CustomIconLabel(
                    label: date,
                    icon: TablerIcons.calendar,
                    color: neutralTheme[500]!)
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
                  Text(
                    lectureName,
                    style: regularBodyText,
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
