import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:presience_app/data/dto/requests/get_history_attendance_dto.dart';
import 'package:presience_app/presentation/blocs/course/course_bloc.dart';
import 'package:presience_app/presentation/blocs/history_attendance/history_attendance_bloc.dart';
import 'package:presience_app/presentation/blocs/schedule/schedule_bloc.dart';
import 'package:presience_app/presentation/pages/presensi/perizinan.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/cards/history_presensi_card.dart';
import 'package:presience_app/presentation/widgets/cards/today_presensi.dart';
import 'package:presience_app/presentation/widgets/empty_state/types/empty_history_presensi.dart';
import 'package:presience_app/presentation/widgets/form/dropdown.dart';
import 'package:presience_app/presentation/widgets/skeletons/today_presensi_skeleton.dart';

import '../../../domain/entities/schedule_week.dart';
import '../../utils/methods.dart';
import '../../widgets/form/dropdown_status.dart';
import '../../widgets/skeletons/history_presensi_skeleton.dart';

class TabPresensiPage extends StatefulWidget {
  final int? selectedTab;
  const TabPresensiPage({super.key, this.selectedTab = 0});
  @override
  State<TabPresensiPage> createState() => _TabPresensiStatePage();
}

class _TabPresensiStatePage extends State<TabPresensiPage>
    with SingleTickerProviderStateMixin {
  List<String> tabs = [
    "Presensi",
    "Perizinan",
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        vsync: this, length: tabs.length, initialIndex: widget.selectedTab!);
    _tabController.addListener(() {
      setState(() {}); // Untuk merender ulang saat tab berubah
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: neutralTheme,
      appBar: AppBar(
          toolbarHeight: 0,
          bottom: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 60),
              child: Container(
                decoration: BoxDecoration(
                    color: neutralTheme,
                    border: Border(
                        bottom:
                            BorderSide(color: neutralTheme[200]!, width: 1))),
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                child: SizedBox(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: tabs.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _tabController.index = index;
                            });
                          },
                          child: Container(
                            decoration: _tabController.index == index
                                ? const BoxDecoration(
                                    color: neutralTheme,
                                    border: Border(
                                        bottom: BorderSide(
                                            color: purpleTheme, width: 2)))
                                : const BoxDecoration(color: neutralTheme),
                            width: (MediaQuery.of(context).size.width - 64) / 2,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            child: Center(
                              child: Text(
                                tabs[index],
                                style: _tabController.index == index
                                    ? mediumBodyTextL.copyWith(
                                        color: purpleTheme,
                                        fontWeight: fontWeight['SemiBold'])
                                    : regularBodyTextL.copyWith(
                                        color: neutralTheme[500]),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ))),
      body: TabBarView(controller: _tabController, children: const [
        PresensiPage(),
        PerizinanPage(),
      ]),
    );
  }
}

class PresensiPage extends StatefulWidget {
  const PresensiPage({super.key});

  @override
  State<PresensiPage> createState() => _PresensiPageState();
}

class _PresensiPageState extends State<PresensiPage> {
  bool isEmpty = false;
  bool isFilterEmpty = false;
  int courseId = 0;
  String attendanceStatus = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 12,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                BlocBuilder<CourseBloc, CourseState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      success: (data) {
                        return CustomDropdown(
                          icon: TablerIcons.book_2,
                          width: MediaQuery.of(context).size.width - 183,
                          items: [
                            const {"id": 0, "name": "Semua Mata Kuliah"},
                            ...data.map((e) => {"id": e.id, "name": e.name!})
                          ],
                          onChange: (int id) {
                            courseId = id;
                            context.read<HistoryAttendanceBloc>().add(
                                  HistoryAttendanceEvent.getHistoryAttendance(
                                    GetHistoryAttendanceDto(
                                      courseId: courseId,
                                      attendanceStatus: attendanceStatus,
                                    ),
                                  ),
                                );
                          },
                        );
                      },
                      orElse: () {
                        return CustomDropdown(
                          icon: TablerIcons.book_2,
                          width: MediaQuery.of(context).size.width - 183,
                          items: const [
                            {
                              "id": 0,
                              "name": "Semua Mata Kuliah",
                            }
                          ],
                        );
                      },
                    );
                  },
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  width: 1,
                  height: 26,
                  color: neutralTheme[100],
                ),
                const SizedBox(
                  width: 8,
                ),
                DropdownStatus(
                  icon: TablerIcons.empathize,
                  width: 133,
                  items: const [
                    {
                      "value": "",
                      "name": "Semua Status",
                    },
                    {
                      "value": "hadir",
                      "name": "Hadir",
                    },
                    {
                      "value": "sakit",
                      "name": "Sakit",
                    },
                    {
                      "value": "izin",
                      "name": "Izin",
                    },
                    {
                      "value": "alpha",
                      "name": "Alpha",
                    },
                  ],
                  onChange: (String status) {
                    attendanceStatus = status;
                    context.read<HistoryAttendanceBloc>().add(
                          HistoryAttendanceEvent.getHistoryAttendance(
                            GetHistoryAttendanceDto(
                              courseId: courseId,
                              attendanceStatus: attendanceStatus,
                            ),
                          ),
                        );
                  },
                ),
              ],
            ),
          ),
          Divider(
            color: neutralTheme[100],
            thickness: 1,
            height: 24,
          ),
          BlocBuilder<ScheduleBloc, ScheduleState>(
            builder: (context, state) {
              return state.maybeWhen(
                success: (data) {
                  if (data.isEmpty) {
                    return Container();
                  }

                  // Filter for the first schedule with status "opened and no attendance"
                  final ScheduleWeek? openedSchedule = data.firstWhereOrNull(
                    (schedule) =>
                        schedule.status == 'opened' &&
                        schedule.attendance == null,
                  );

                  if (openedSchedule == null) {
                    return Container();
                  }

                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TodayPresensiCard(
                          scheduleWeek: openedSchedule,
                          onTapPresensi: () {
                            context.push('/camera/presensi', extra: {
                              'openedAt': openedSchedule.openedAt,
                              'scheduleWeekId': openedSchedule.id
                            });
                          },
                          onTapAjukanIzin: () {
                            context.push('/pengajuan_izin/during', extra: {
                              'scheduleWeek': openedSchedule,
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                    ],
                  );
                },
                orElse: () {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: const TodayPresensiSkeleton(),
                  );
                },
              );
            },
          ),
          BlocBuilder<HistoryAttendanceBloc, HistoryAttendanceState>(
            builder: (context, state) {
              return state.maybeWhen(
                success: (data) {
                  if (data.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: EmptyHistoryPresensi(),
                    );
                  }

                  return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: HistoryPresensiCard(
                          courseName: data[index].schedule!.course!.name!,
                          date: getFormattedDate(data[index].date!),
                          openedTime: data[index].openedAt!,
                          closedTime: data[index].closedAt ?? 'Belum ditutup',
                          courseTime: data[index].schedule!.course!.time!,
                          alpha: data[index].attendance!.alpha!,
                          sakit: data[index].attendance!.sakit!,
                          izin: data[index].attendance!.izin!,
                          onTap: () {
                            context.read<HistoryAttendanceBloc>().add(
                                  HistoryAttendanceEvent.getHistoryAttendance(
                                    GetHistoryAttendanceDto(
                                      courseId:
                                          data[index].schedule!.course!.id!,
                                    ),
                                  ),
                                );
                            context.push(
                              '/presensi/detail',
                              extra: data[index],
                            );
                          },
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 8,
                    ),
                  );
                },
                orElse: () {
                  return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: HistoryPresensiSkeleton(),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 8,
                    ),
                  );
                },
              );
            },
          ),
          // DATA PRESENSI
          // if (!isEmpty)
          //   const CustomSection(
          //       title: "Minggu ke-2", child: ContentofWeekPresensi()),
          // if (!isEmpty)
          //   const SizedBox(
          //     height: 12,
          //   ),
          // if (!isEmpty)
          //   const CustomSection(
          //       title: "Minggu ke-1", child: ContentofWeekPresensi()),
          // if (isEmpty)
          //   Container(
          //     padding: const EdgeInsets.symmetric(vertical: 28),
          //     child: isFilterEmpty
          //         ? const EmptyFiltered()
          //         : const EmptyHistoryPresensi(),
          //   ),
        ],
      ),
    );
  }
}

class ContentofWeekPresensi extends StatefulWidget {
  const ContentofWeekPresensi({
    super.key,
  });

  @override
  State<ContentofWeekPresensi> createState() => _ContentofWeekPresensiState();
}

class _ContentofWeekPresensiState extends State<ContentofWeekPresensi> {
  List<Map<String, dynamic>> lastWeekCourses = [
    {
      'courseName': "Pembelajaran Mesin",
      'date': "21/10/2024",
      'openedTime': "00:00",
      'closedTime': "00:00",
      'courseTime': 6,
      'alpha': 6,
      'izin': 0,
      'sakit': 0,
    },
    {
      'courseName': "Metodologi Penelitian",
      'date': "21/10/2024",
      'openedTime': "00:00",
      'closedTime': "00:00",
      'courseTime': 4,
      'alpha': 0,
      'izin': 0,
      'sakit': 4,
    },
    {
      'courseName': "Pengolahan Citra dan Visi Komputer",
      'date': "21/10/2024",
      'openedTime': "00:00",
      'closedTime': "00:00",
      'courseTime': 6,
      'alpha': 0,
      'izin': 1,
      'sakit': 0,
    },
    {
      'courseName': "Administrasi dan Keamanan Jaringan",
      'date': "21/10/2024",
      'openedTime': "00:00",
      'closedTime': "00:00",
      'courseTime': 4,
      'alpha': 0,
      'izin': 4,
      'sakit': 0,
    },
    {
      'courseName': "Bahasa Inggris Persiapan Kerja",
      'date': "21/10/2024",
      'openedTime': "00:00",
      'closedTime': "00:00",
      'courseTime': 4,
      'alpha': 0,
      'izin': 0,
      'sakit': 0,
    },
    {
      'courseName': "Kewirausahaan",
      'date': "21/10/2024",
      'openedTime': "00:00",
      'closedTime': "00:00",
      'courseTime': 2,
      'alpha': 0,
      'izin': 0,
      'sakit': 0,
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
            HistoryPresensiCard(
          courseName: lastWeekCourses[index]['courseName'],
          date: lastWeekCourses[index]['date'],
          openedTime: lastWeekCourses[index]['openedTime'],
          closedTime: lastWeekCourses[index]['closedTime'],
          courseTime: lastWeekCourses[index]['courseTime'],
          alpha: lastWeekCourses[index]['alpha'],
          sakit: lastWeekCourses[index]['sakit'],
          izin: lastWeekCourses[index]['izin'],
          onTap: () => context.push('/presensi/detail'),
        );
        // return Text(lastWeekCourses[index]['courseName']);
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 8,
      ),
    );
  }
}
