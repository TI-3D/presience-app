import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:presience_app/domain/entities/schedule_week.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/buttons/button.dart';
import 'package:presience_app/presentation/widgets/labels/icon_label.dart';
import 'package:presience_app/presentation/widgets/labels/tag_label.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TodayPresensiSkeleton extends StatelessWidget {
  final VoidCallback? onTapPresensi;
  final VoidCallback? onTapAjukanIzin;

  const TodayPresensiSkeleton({
    super.key,
    this.onTapPresensi,
    this.onTapAjukanIzin,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      containersColor: neutralTheme[50],
      enabled: true, // Flag to toggle skeleton
      enableSwitchAnimation: true, // To enable transition
      child: Container(
        width: MediaQuery.of(context).size.width - 32,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            color: neutralTheme),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Bone.icon(size: 28),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Administrasi Citra dan Visi Komputer",
                  style: mediumBodyTextXL.copyWith(),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Lecture Name',
                  style: regularBodyTextXS.copyWith(),
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Opacity(
              opacity: 0.4,
              child: Row(
                children: [
                  CustomIconLabel(
                      label: 'Label',
                      icon: TablerIcons.building,
                      color: neutralTheme),
                  const SizedBox(
                    width: 8,
                  ),
                  CustomIconLabel(
                      label: 'Label',
                      icon: TablerIcons.stairs,
                      color: neutralTheme),
                  const SizedBox(
                    width: 8,
                  ),
                  CustomIconLabel(
                      label: 'Label',
                      icon: TablerIcons.calendar_time,
                      color: neutralTheme),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Column(
              children: [
                Bone.button(
                  width: double.infinity,
                  height: 36,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Bone.button(
                  width: double.infinity,
                  height: 36,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
