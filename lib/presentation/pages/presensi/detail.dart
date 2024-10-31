// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:presience_app/presentation/utils/methods.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/cards/attendance.dart';
import 'package:presience_app/presentation/widgets/cards/history_course_card.dart';
import 'package:presience_app/presentation/widgets/cards/section.dart';
import 'package:presience_app/presentation/widgets/cards/title_section.dart';
import 'package:presience_app/presentation/widgets/containers/content.dart';
import 'package:presience_app/presentation/widgets/containers/detail.dart';
import 'package:presience_app/presentation/widgets/labels/icon_label.dart';
import 'package:presience_app/presentation/widgets/labels/tag_label.dart';
import 'package:presience_app/presentation/widgets/navigations/app_bar.dart';

import '../../../domain/entities/schedule_week.dart';

class DetailPresensiPage extends StatelessWidget {
  ScheduleWeek scheduleWeek;

  DetailPresensiPage({
    super.key,
    required this.scheduleWeek,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: neutralTheme,
      appBar: CustomAppBar(
        title: 'Detail Presensi',
        onTap: () {
          GoRouter.of(context).pop();
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 12, bottom: 16),
        child:
            // SKELETON
            // DetailPresensiSkeletonPage(),
            // END SKELETON
            Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleSection(title: scheduleWeek.schedule!.course!.name!),
                      SizedBox.fromSize(size: const Size.fromHeight(4)),
                      Text(
                        scheduleWeek.schedule!.lecturer!.name!,
                        style: regularBodyText,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Row(children: [
                        CustomIconLabel(
                            label: scheduleWeek.schedule!.room!.name!,
                            icon: TablerIcons.building,
                            color: neutralTheme[400]!),
                        const SizedBox(
                          width: 8,
                        ),
                        CustomIconLabel(
                            label:
                                'Lantai ${scheduleWeek.schedule!.week!.name!}',
                            icon: TablerIcons.stairs,
                            color: neutralTheme[400]!),
                        const SizedBox(
                          width: 8,
                        ),
                        CustomIconLabel(
                            label:
                                '${scheduleWeek.schedule!.startTime!}-${scheduleWeek.schedule!.endTime!}',
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
            Divider(
              height: 24,
              thickness: 1,
              color: neutralTheme[100],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleSection(title: 'Total Presentase Kehadiran'),
                      AttendancePercentage(
                        attendancePercentage: 82,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              height: 24,
              thickness: 1,
              color: neutralTheme[100],
            ),

            //status->hadir
            CustomSection(
              title: 'Detail Presensi',
              child: Column(
                children: [
                  CustomFirstDetailContainer(
                    children: [
                      const TitleDetail(title: 'Minggu'),
                      ValueDetail(content: scheduleWeek.schedule!.week!.name!),
                    ],
                  ),
                  CustomMiddleDetailContainer(
                    children: [
                      const TitleDetail(title: 'Tanggal'),
                      ValueDetail(
                        content: getFormattedDate(scheduleWeek.date!),
                      ),
                    ],
                  ),
                  if (scheduleWeek.openedAt != null)
                    CustomMiddleDetailContainer(
                      children: [
                        const TitleDetail(title: 'Waktu dibuka'),
                        ValueDetail(content: scheduleWeek.openedAt!),
                      ],
                    ),
                  if (scheduleWeek.closedAt != null)
                    CustomMiddleDetailContainer(
                      children: [
                        const TitleDetail(title: 'Waktu ditutup'),
                        ValueDetail(
                          content: scheduleWeek.status!,
                        ),
                      ],
                    ),
                  CustomMiddleDetailContainer(
                    children: [
                      const TitleDetail(title: 'Waktu presensi'),
                      ValueDetail(content: scheduleWeek.attendance!.entryTime!),
                    ],
                  ),
                  if (scheduleWeek.attendance!.izin! !=
                          scheduleWeek.schedule!.course!.time &&
                      scheduleWeek.attendance!.alpha! !=
                          scheduleWeek.schedule!.course!.time &&
                      scheduleWeek.attendance!.sakit! !=
                          scheduleWeek.schedule!.course!.time)
                    const CustomLastDetailContainer(
                      children: [
                        TitleDetail(title: 'Status'),
                        CustomTaglabelGreen(label: 'Hadir'),
                      ],
                    ),
                  if (scheduleWeek.attendance!.sakit! ==
                      scheduleWeek.schedule!.course!.time!)
                    const CustomLastDetailContainer(
                      children: [
                        TitleDetail(title: 'Status'),
                        CustomTaglabelOrange(label: 'Sakit'),
                      ],
                    ),
                  if (scheduleWeek.attendance!.izin! ==
                      scheduleWeek.schedule!.course!.time!)
                    const CustomLastDetailContainer(
                      children: [
                        TitleDetail(title: 'Status'),
                        CustomTaglabelOrange(label: 'Izin'),
                      ],
                    ),
                  if (scheduleWeek.attendance!.alpha! ==
                      scheduleWeek.schedule!.course!.time)
                    CustomLastDetailContainer(
                      children: [
                        TitleDetail(
                          title: 'Status',
                          child: Row(
                            children: [
                              const Icon(
                                TablerIcons.alert_circle,
                                color: redTheme,
                                size: 14,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                'Status dapat diubah dalam 7 hari lagi',
                                style: regularBodyTextXS.copyWith(
                                  color: redTheme,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            const CustomTaglabelRed(label: 'Alpha'),
                            const SizedBox(
                              width: 8,
                            ),
                            Icon(
                              TablerIcons.refresh,
                              color: neutralTheme[300],
                              size: 24,
                            ),
                          ],
                        )
                      ],
                    ),
                  if (scheduleWeek.attendance!.izin! > 0 &&
                      scheduleWeek.attendance!.izin! !=
                          scheduleWeek.schedule!.course!.time)
                    CustomMiddleDetailContainer(
                      children: [
                        const TitleDetail(title: 'Terlambat'),
                        ValueDetail(
                          content: '${scheduleWeek.attendance!.izin!} Jam',
                        ),
                      ],
                    ),
                  if (scheduleWeek.attendance!.alpha! > 0 &&
                      scheduleWeek.attendance!.alpha! !=
                          scheduleWeek.schedule!.course!.time)
                    CustomMiddleDetailContainer(
                      children: [
                        const TitleDetail(title: 'Terlambat'),
                        ValueDetail(
                          content: '${scheduleWeek.attendance!.alpha!} Jam',
                        ),
                      ],
                    ),
                  if (scheduleWeek.attendance!.izin! > 0 &&
                      scheduleWeek.attendance!.izin! !=
                          scheduleWeek.schedule!.course!.time)
                    const CustomLastDetailContainer(
                      children: [
                        TitleDetail(title: 'Status terlambat'),
                        CustomTaglabelOrange(label: 'Izin')
                      ],
                    ),
                  if (scheduleWeek.attendance!.alpha! > 0 &&
                      scheduleWeek.attendance!.alpha! !=
                          scheduleWeek.schedule!.course!.time)
                    const CustomLastDetailContainer(
                      children: [
                        TitleDetail(title: 'Status terlambat'),
                        CustomTaglabelRed(label: 'Alpha')
                      ],
                    ),
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
                    title: 'Riwayat Presensi', child: ContentofWeekCourse())
              ],
            )
          ],
        ),
      ),
    ));
  }
}

class ContentofWeekCourse extends StatefulWidget {
  const ContentofWeekCourse({
    super.key,
  });

  @override
  State<ContentofWeekCourse> createState() => _ContentofWeekCourseState();
}

class _ContentofWeekCourseState extends State<ContentofWeekCourse> {
  List<Map<String, dynamic>> lastWeekCourses = [
    {
      'courseName': "Pembelajaran Mesin",
      'date': "21/10/2024",
      'openedTime': "12:00",
      'closedTime': "00:00",
      'courseTime': 6,
      'alpha': 0,
      'izin': 3,
      'sakit': 0,
      'courseWeek': 6,
    },
    {
      'courseName': "Pembelajaran Mesin",
      'date': "21/10/2024",
      'openedTime': "12:00",
      'closedTime': "00:00",
      'courseTime': 6,
      'alpha': 0,
      'izin': 0,
      'sakit': 3,
      'courseWeek': 5,
    },
    {
      'courseName': "Pembelajaran Mesin",
      'date': "21/10/2024",
      'openedTime': "12:00",
      'closedTime': "00:00",
      'courseTime': 6,
      'alpha': 3,
      'izin': 0,
      'sakit': 0,
      'courseWeek': 4,
    },
    {
      'courseName': "Pembelajaran Mesin",
      'date': "21/10/2024",
      'openedTime': "12:00",
      'closedTime': "00:00",
      'courseTime': 6,
      'alpha': 0,
      'izin': 0,
      'sakit': 0,
      'courseWeek': 3,
    },
    {
      'courseName': "Pembelajaran Mesin",
      'date': "21/10/2024",
      'openedTime': "12:00",
      'closedTime': "00:00",
      'courseTime': 6,
      'alpha': 0,
      'izin': 0,
      'sakit': 6,
      'courseWeek': 2,
    },
    {
      'courseName': "Pembelajaran Mesin",
      'date': "21/10/2024",
      'openedTime': "12:00",
      'closedTime': "00:00",
      'courseTime': 6,
      'alpha': 0,
      'izin': 0,
      'sakit': 0,
      'courseWeek': 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: lastWeekCourses.length,
      itemBuilder: (context, index) {
        return
            //  HistoryPresensiSkeleton();
            HistoryCourseCard(
          courseName: lastWeekCourses[index]['courseName'],
          date: lastWeekCourses[index]['date'],
          openedTime: lastWeekCourses[index]['openedTime'],
          closedTime: lastWeekCourses[index]['closedTime'],
          courseTime: lastWeekCourses[index]['courseTime'],
          alpha: lastWeekCourses[index]['alpha'],
          sakit: lastWeekCourses[index]['sakit'],
          izin: lastWeekCourses[index]['izin'],
          courseWeek: lastWeekCourses[index]['courseWeek'].toString(),
          onTap: () => context.push('/presensi/detail'),
          // onTap: () => context.push('/presensi/detail'),
        );
        // return Text(lastWeekCourses[index]['courseName']);
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 8,
      ),
    );
  }
}
