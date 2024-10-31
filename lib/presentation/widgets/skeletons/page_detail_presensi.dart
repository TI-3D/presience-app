import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/cards/attendance.dart';
import 'package:presience_app/presentation/widgets/cards/section.dart';
import 'package:presience_app/presentation/widgets/cards/title_section.dart';
import 'package:presience_app/presentation/widgets/labels/icon_label.dart';
import 'package:presience_app/presentation/widgets/skeletons/detail_container.dart';
import 'package:presience_app/presentation/widgets/skeletons/history_course_skeleton.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DetailPresensiSkeletonPage extends StatelessWidget {
  const DetailPresensiSkeletonPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      containersColor: neutralTheme[50],
      enabled: true, // Flag to toggle skeleton
      enableSwitchAnimation: true, //
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TitleSection(title: 'Pembelajaran Mesin'),
                        SizedBox.fromSize(size: const Size.fromHeight(4)),
                        Text(
                          'Amalia Agung Septarina, S.S.M.Tr.TT.',
                          style: regularBodyText,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Row(children: [
                        CustomIconLabel(
                            label: 'LPR 4',
                            icon: TablerIcons.building,
                            color: neutralTheme[400]!),
                        const SizedBox(
                          width: 8,
                        ),
                        CustomIconLabel(
                            label: 'Lantai 7',
                            icon: TablerIcons.stairs,
                            color: neutralTheme[400]!),
                        const SizedBox(
                          width: 8,
                        ),
                        CustomIconLabel(
                            label: '11:40-16:00',
                            icon: TablerIcons.calendar_time,
                            color: neutralTheme[400]!),
                        const SizedBox(
                          width: 8,
                        ),
                      ]),
                    ],
                  )
                ],
              ),
            ),
          ),
          Divider(
            height: 24,
            thickness: 1,
            color: neutralTheme[100],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleSection(title: 'Total Presentase Kehadiran'),
                        AttendancePercentage(
                          attendancePercentage: 82,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 24,
            thickness: 1,
            color: neutralTheme[100],
          ),

          //status->hadir
          const CustomSection(
            title: 'Detail Presensi',
            child: Column(
              children: [
                FirstDetailContainerSkeleton(),
                MiddleDetailContainerSkeleton(),
                MiddleDetailContainerSkeleton(),
                MiddleDetailContainerSkeleton(),
                LastDetailContainerSkeleton(),
              ],
            ),
          ),
          Divider(
            height: 24,
            thickness: 1,
            color: neutralTheme[100],
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment:
                MainAxisAlignment.start, // Menambahkan ini untuk rata kiri
            children: [
              CustomSection(
                  title: 'Riwayat Presensi',
                  child: Column(
                    children: [
                      HistoryCourseSkeleton(),
                      SizedBox(
                        height: 8,
                      ),
                      HistoryCourseSkeleton(),
                      SizedBox(
                        height: 8,
                      ),
                      HistoryCourseSkeleton(),
                      SizedBox(
                        height: 8,
                      ),
                      HistoryCourseSkeleton(),
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}
