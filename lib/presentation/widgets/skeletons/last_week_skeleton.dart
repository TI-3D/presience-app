// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:presience_app/presentation/utils/methods.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/cards/card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomLastWeekSkeleton extends StatelessWidget {
  CustomLastWeekSkeleton({
    super.key,
  });

  late Widget tagLabel;
  late Icon? additionIcon;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      containersColor: neutralTheme[50],
      enabled: true, // Flag to toggle skeleton
      enableSwitchAnimation: true, // To enable transition
      child: CustomCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Text(
                  BoneMock.fullName,
                  style: mediumBodyTextL,
                )),
                Text(
                  'Tag',
                  style: mediumBodyTextL,
                )
              ],
            ),
            Text(BoneMock.fullName, style: regularBodyText)
          ],
        ),
      ),
    );
  }
}
