import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/cards/card.dart';
import 'package:presience_app/presentation/widgets/labels/icon_label.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PerizinanPresensiSkeleton extends StatelessWidget {
  const PerizinanPresensiSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      containersColor: neutralTheme[50],
      enabled: true, // Flag to toggle skeleton
      enableSwitchAnimation: true, // To enable transition
      child: CustomCard(
        child: GestureDetector(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tag',
                    style: mediumBodyTextL,
                  ),
                  CustomIconLabel(
                      label: "Label",
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
                      BoneMock.fullName,
                      style: mediumBodyTextL,
                    ),
                    Text(
                      BoneMock.subtitle,
                      style: regularBodyText,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
