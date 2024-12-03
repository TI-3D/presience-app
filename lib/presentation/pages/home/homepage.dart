// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:presience_app/domain/entities/schedule_week.dart';
import 'package:presience_app/presentation/blocs/attendance/attendance_bloc.dart';
import 'package:presience_app/presentation/blocs/attendance_week/attendance_week_bloc.dart';
import 'package:presience_app/presentation/blocs/auth/auth_bloc.dart';
import 'package:presience_app/presentation/blocs/schedule/schedule_bloc.dart';
import 'package:presience_app/presentation/pages/presensi/presensi.dart';
import 'package:presience_app/presentation/pages/profile/profile.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/cards/attendance.dart';
import 'package:presience_app/presentation/widgets/cards/last_week_card.dart';
import 'package:presience_app/presentation/widgets/cards/title_section.dart';
import 'package:presience_app/presentation/widgets/cards/today_presensi.dart';
import 'package:presience_app/presentation/widgets/empty_state/types/empty_presensi.dart';
import 'package:presience_app/presentation/widgets/navigations/menu_item.dart';
import 'package:presience_app/presentation/widgets/skeletons/attendance.dart';
import 'package:presience_app/presentation/widgets/skeletons/last_week_skeleton.dart';
import 'package:presience_app/presentation/widgets/skeletons/today_presensi_skeleton.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../data/datasources/remote_datasources/firebase_remote_datasource.dart';
import '../../../data/dto/requests/get_history_attendance_dto.dart';
import '../../blocs/history_attendance/history_attendance_bloc.dart';
import '../../widgets/cards/section.dart';
import '../../widgets/empty_state/types/empty_history_presensi.dart';

class NavigationHomePage extends StatefulWidget {
  int? selectedPageIndex;
  int? selectedTab;

  NavigationHomePage(
      {super.key, this.selectedPageIndex = 0, this.selectedTab = 0});

  @override
  State<NavigationHomePage> createState() => _NavigationHomePageState();
}

class _NavigationHomePageState extends State<NavigationHomePage> {
  final List<String> _routeNames = [
    '/homepage',
    '/homepage/presensi',
    '/homepage/profil'
  ];

  void _onItemTapped(int index) {
    setState(() {
      widget.selectedPageIndex = index;
      context.go(_routeNames[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = <Widget>[
      const HomePage(),
      TabPresensiPage(selectedTab: widget.selectedTab),
      const ProfilPage(),
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: neutralTheme,
        body: pages[widget.selectedPageIndex!],
        bottomNavigationBar: Container(
          height: 72,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: neutralTheme[200]!, width: 1),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomButtomNavigationMenuItem(
                  label: "Beranda",
                  icon: TablerIcons.home,
                  index: 0,
                  selectedPageIndex: widget.selectedPageIndex!,
                  onTap: _onItemTapped),
              CustomButtomNavigationMenuItem(
                  label: "Presensi",
                  icon: TablerIcons.news,
                  index: 1,
                  selectedPageIndex: widget.selectedPageIndex!,
                  onTap: _onItemTapped),
              CustomButtomNavigationMenuItem(
                  label: "Profil",
                  icon: TablerIcons.user_circle,
                  index: 2,
                  selectedPageIndex: widget.selectedPageIndex!,
                  onTap: _onItemTapped),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLastWeekEmpty = false;

  @override
  void initState() {
    FirebaseRemoteDatasource().initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 12),
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            // horizontal: 16,
            vertical: 20,
          ),
          color: purpleTheme[50],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loginSuccess: (data) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 52,
                              width: 52,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                    color: neutralTheme[100]!, width: 1),
                              ),
                              child: (data.user!.avatar != null)
                                  ? Image.network(
                                      data.user!.avatar!,
                                      fit: BoxFit.cover,
                                    )
                                  : (data.user!.gender == 'male')
                                      ? Image.asset(
                                          'assets/default/Men-Avatar-Default.png',
                                          fit: BoxFit.cover,
                                        )
                                      : Image.asset(
                                          'assets/default/Girl-Avatar-Default.png',
                                          fit: BoxFit.cover,
                                        ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data.user!.name!, style: mediumBodyTextXL),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  data.user!.nim!,
                                  style: mediumBodyTextS,
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    orElse: () {
                      return Skeletonizer(
                        enabled: true, // Flag to toggle skeleton
                        enableSwitchAnimation: true, //
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  height: 52,
                                  width: 52,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        color: neutralTheme[100]!, width: 1),
                                  ),
                                  child: const Bone.circle()),
                              const SizedBox(
                                width: 8,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(BoneMock.name, style: mediumBodyTextXL),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    BoneMock.phone,
                                    style: mediumBodyTextS,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loginSuccess: (data) {
                        return BlocBuilder<AttendanceBloc, AttendanceState>(
                          builder: (context, state) {
                            return state.maybeWhen(
                              success: (attendance) {
                                return AttendanceCard(
                                  data: data,
                                  attendanceInformation: attendance,
                                );
                              },
                              orElse: () {
                                return const AttendanceSkeleton();
                              },
                            );
                          },
                        );
                      },
                      orElse: () {
                        return const AttendanceSkeleton();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          color: neutralTheme,
          child: Column(
            children: [
              Divider(
                color: neutralTheme[100],
                thickness: 1,
                height: 1,
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: const TitleSection(title: "Hari Ini"),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const ContentofHariIni2(),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Divider(
                color: neutralTheme[100],
                thickness: 1,
                height: 1,
              ),
              const SizedBox(
                height: 12,
              ),
              BlocBuilder<AttendanceWeekBloc, AttendanceWeekState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    success: (data) {
                      if (data.isEmpty) {
                        return const EmptyHistoryPresensi();
                      }

                      return CustomSection(
                        title: "Riwayat Presensi",
                        child: ContentofRiwayatPresensi(
                          scheduleWeek: data,
                        ),
                      );
                    },
                    loading: () {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            CustomLastWeekSkeleton(),
                            const SizedBox(height: 8),
                            CustomLastWeekSkeleton(),
                            const SizedBox(height: 8),
                            CustomLastWeekSkeleton(),
                          ],
                        ),
                      );
                    },
                    orElse: () {
                      return const EmptyHistoryPresensi();
                    },
                  );
                },
              )
            ],
          ),
        )
      ],
    );
  }
}

class ContentofRiwayatPresensi extends StatefulWidget {
  final List<ScheduleWeek> scheduleWeek;

  const ContentofRiwayatPresensi({
    super.key,
    required this.scheduleWeek,
  });

  @override
  State<ContentofRiwayatPresensi> createState() =>
      _ContentofRiwayatPresensiState();
}

class _ContentofRiwayatPresensiState extends State<ContentofRiwayatPresensi> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.scheduleWeek.length,
      itemBuilder: (context, index) {
        return CustomLastWeekCard(
          courseName: widget.scheduleWeek[index].schedule!.course!.name!,
          lectureName: widget.scheduleWeek[index].schedule!.lecturer!.name!,
          courseTime: widget.scheduleWeek[index].schedule!.course!.time!,
          alpha: widget.scheduleWeek[index].attendance!.alpha!,
          sakit: widget.scheduleWeek[index].attendance!.sakit!,
          izin: widget.scheduleWeek[index].attendance!.izin!,
          onTap: () {
            context.read<HistoryAttendanceBloc>().add(
                  HistoryAttendanceEvent.getHistoryAttendance(
                    GetHistoryAttendanceDto(
                      courseId: widget.scheduleWeek[index].schedule!.course!.id,
                    ),
                  ),
                );
            context.push(
              '/presensi/detail',
              extra: widget.scheduleWeek[index],
            );
          },
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 8,
      ),
    );
  }
}

class ContentofHariIni2 extends StatefulWidget {
  const ContentofHariIni2({
    super.key,
  });

  @override
  State<ContentofHariIni2> createState() => _ContentofHariIni2State();
}

class _ContentofHariIni2State extends State<ContentofHariIni2> {
  int currentCard = 0;

  Widget indicator(int index, int length) {
    return Container(
      margin: EdgeInsets.only(right: index < length - 1 ? 4.0 : 0),
      width: currentCard == index ? 16 : 6,
      height: 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: currentCard == index ? purpleTheme : neutralTheme[100],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScheduleBloc, ScheduleState>(
      builder: (context, state) {
        return state.maybeWhen(
          success: (data) {
            // Sorting the data list: 'opened' items first, then others
            final sortedData = List.from(data)
              ..sort(
                (a, b) => (b.status == 'opened' ? 1 : 0)
                    .compareTo(a.status == 'opened' ? 1 : 0),
              );

            if (sortedData.isEmpty) {
              return const Column(
                children: [
                  EmptyPresensi(),
                ],
              );
            }

            return Column(
              children: [
                CarouselSlider.builder(
                  itemCount: sortedData.length,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width -
                          32, // 80% of screen width
                      child: TodayPresensiCard(
                        scheduleWeek: sortedData[itemIndex],
                        onTapPresensi: () {
                          context.push('/camera/presensi', extra: {
                            'openedAt': sortedData[itemIndex].openedAt,
                            'scheduleWeekId': sortedData[itemIndex].id,
                          });
                        },
                        onTapAjukanIzin: () {
                          context.push('/pengajuan_izin/during', extra: {
                            'scheduleWeek': sortedData[itemIndex],
                          });
                        },
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 234,
                    enableInfiniteScroll: false,
                    viewportFraction: 1,
                    padEnds: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentCard = index;
                      });
                    },
                  ),
                ),
                if (data.length > 1) ...[
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(data.length, (index) {
                      return indicator(index, data.length);
                    }),
                  )
                ]
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
    );
  }
}
