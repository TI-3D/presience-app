import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/cards/history_course_card.dart';
import 'package:presience_app/presentation/widgets/cards/section.dart';
import 'package:presience_app/presentation/widgets/cards/title_section.dart';
import 'package:presience_app/presentation/widgets/containers/content.dart';
import 'package:presience_app/presentation/widgets/containers/detail.dart';
import 'package:presience_app/presentation/widgets/form/label.dart';
import 'package:presience_app/presentation/widgets/labels/icon_label.dart';
import 'package:presience_app/presentation/widgets/labels/tag_label.dart';
import 'package:presience_app/presentation/widgets/navigations/app_bar.dart';

class DetailPresensiPage extends StatelessWidget {
  const DetailPresensiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: neutralTheme,
      appBar: const CustomAppBar(
        title: 'Detail Presensi',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleSection(title: 'Pembelajaran Mesin'),
                          SizedBox.fromSize(size: Size.fromHeight(4)),
                          Text(
                            'Amalia Agung Septarina, S.S.M.Tr.TT.',
                            style: regularBodyText,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Row(children: [
                          CustomIconLabel(
                              label: 'LPR 4',
                              icon: TablerIcons.building,
                              color: neutralTheme[400]!),
                          SizedBox(
                            width: 8,
                          ),
                          CustomIconLabel(
                              label: 'Lantai 7',
                              icon: TablerIcons.stairs,
                              color: neutralTheme[400]!),
                          SizedBox(
                            width: 8,
                          ),
                          CustomIconLabel(
                              label: '11:40-16:00',
                              icon: TablerIcons.calendar_time,
                              color: neutralTheme[400]!),
                          SizedBox(
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
              height: 0,
              thickness: 1,
              color: neutralTheme![100],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleSection(title: 'Total Presentase Kehadiran'),
                          SizedBox.fromSize(size: Size.fromHeight(8)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text('82%',
                                  style: TextStyle(
                                    fontFamily: typeFace,
                                    fontSize: 32,
                                    color: orangeTheme[500],
                                  )),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                'Kehadiranmu',
                                style: regularBodyTextS.copyWith(
                                    color: orangeTheme![500]),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              height: 0,
              thickness: 1,
              color: neutralTheme![100],
            ),
            SizedBox(
              height: 12,
            ),
            //status->hadir
            CustomSection(
              title: 'Detail Presensi',
              child: Column(
                children: [
                  CustomFirstDetailContainer(
                    children: [
                      TitleDetail(title: 'Minggu'),
                      ValueDetail(content: 'Minggu ke-7'),
                    ],
                  ),
                  CustomMiddleDetailContainer(
                    children: [
                      TitleDetail(title: 'Tanggal'),
                      ValueDetail(content: '07/10/2024'),
                    ],
                  ),
                  CustomMiddleDetailContainer(
                    children: [
                      TitleDetail(title: 'Waktu dibuka'),
                      ValueDetail(content: '12:01:23 WIB'),
                    ],
                  ),
                  CustomMiddleDetailContainer(
                    children: [
                      TitleDetail(title: 'Waktu presensi'),
                      ValueDetail(content: '12:12:23 WIB'),
                    ],
                  ),
                  CustomMiddleDetailContainer(
                    children: [
                      TitleDetail(title: 'Waktu ditutup'),
                      ValueDetail(content: '12:15:23 WIB'),
                    ],
                  ),
                  CustomLastDetailContainer(
                    children: [
                      TitleDetail(title: 'Status'),
                      CustomTaglabelGreen(label: 'Hadir')
                    ],
                  ),
                  CustomLastDetailContainer(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start, // Aligns "Status" to the left
                              children: [
                                Text(
                                  'Status',
                                  style: regularBodyText.copyWith(
                                    color: neutralTheme[500],
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      TablerIcons.alert_circle,
                                      color: redTheme[600],
                                      size: 12,
                                    ),
                                    SizedBox(width: 2),
                                    Text(
                                      'Status dapat diubah dalam 7 hari lagi',
                                      style: regularSmallText.copyWith(
                                        color: redTheme[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
                                  size: 20,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )

                      // ValueDetail(content: 'Tidak ada keterangan')
                    ],
                  ),
                  CustomMiddleDetailContainer(
                    children: [
                      TitleDetail(title: 'Terlambat'),
                      ValueDetail(content: '2 Jam'),
                    ],
                  ),
                  CustomLastDetailContainer(
                    children: [
                      TitleDetail(title: 'Status'),
                      CustomTaglabelOrange(label: 'Izin')
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Divider(
              height: 0,
              thickness: 1,
              color: neutralTheme![100],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment
                      .start, // Menambahkan ini untuk rata kiri
                  children: [
                    CustomSection(
                        title: 'Riwayat Presensi', child: ContentofWeekCourse())
                  ],
                ),
              ),
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
      'minggu': 6,
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
      'minggu': 5,
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
      'minggu': 4,
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
      'minggu': 3,
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
      'minggu': 2,
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
      'minggu': 1,
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
          courseWeek: 'Minggu ke-${lastWeekCourses[index]['minggu']}',

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
