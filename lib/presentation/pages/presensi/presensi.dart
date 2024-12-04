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
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2, initialIndex: 0);
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
          backgroundColor: neutralTheme,
          toolbarHeight: 0,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(56),
              child: TabBar(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                tabs: const [
                  SizedBox(height: 54, child: Center(child: Text("Presensi"))),
                  SizedBox(height: 54, child: Center(child: Text("Perizinan"))),
                ],
                labelStyle: mediumBodyTextL.copyWith(color: purpleTheme),
                unselectedLabelStyle:
                    regularBodyTextL.copyWith(color: neutralTheme[500]),
                controller: _tabController,
                labelColor: purpleTheme,
                unselectedLabelColor: neutralTheme[400],
                dividerHeight: 1.5,
                dividerColor: neutralTheme[100],
                indicator: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: purpleTheme,
                      width: 2,
                    ),
                  ),
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
                          openedTime: data[index].openedAt ?? '-',
                          closedTime: data[index].closedAt ?? '-',
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
        ],
      ),
    );
  }
}
