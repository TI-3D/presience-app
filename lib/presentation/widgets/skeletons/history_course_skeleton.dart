import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:presience_app/presentation/utils/methods.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/cards/card.dart';
import 'package:presience_app/presentation/widgets/labels/icon_label.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HistoryCourseSkeleton extends StatelessWidget {
  const HistoryCourseSkeleton({
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tag',
                style: mediumBodyTextL,
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
                      BoneMock.fullName,
                      style: mediumBodyTextL,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        CustomIconLabel(
                            label: 'Label',
                            icon: TablerIcons.calendar,
                            color: neutralTheme[400]!),
                        const SizedBox(
                          width: 8,
                        ),
                        CustomIconLabel(
                            label: 'Label',
                            icon: TablerIcons.clock_play,
                            color: neutralTheme[400]!),
                        const SizedBox(
                          width: 8,
                        ),
                        CustomIconLabel(
                            label: 'Label',
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
      ),
    );
  }
}
