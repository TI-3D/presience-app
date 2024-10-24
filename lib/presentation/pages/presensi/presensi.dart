import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:presience_app/presentation/blocs/schedule/schedule_bloc.dart';
import 'package:presience_app/presentation/pages/presensi/perizinan.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/cards/history_presensi_card.dart';
import 'package:presience_app/presentation/widgets/cards/section.dart';
import 'package:presience_app/presentation/widgets/cards/today_presensi.dart';
import 'package:presience_app/presentation/widgets/form/dropdown.dart';
import 'package:presience_app/presentation/widgets/skeletons/history_presensi_skeleton.dart';

class TabPresensiPage extends StatefulWidget {
  const TabPresensiPage({super.key});
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
  int currentTab = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
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
              preferredSize: Size(MediaQuery.of(context).size.width, 52),
              child: Container(
                decoration: BoxDecoration(
                    color: neutralTheme,
                    border: Border(
                        bottom:
                            BorderSide(color: neutralTheme[200]!, width: 1))),
                height: 52,
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

class PresensiPage extends StatelessWidget {
  const PresensiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 16),
      children: [
        const SizedBox(
          height: 12,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              CustomDropdown(
                  icon: TablerIcons.book_2,
                  width: MediaQuery.of(context).size.width - 183,
                  items: const [
                    "Semua Mata Kuliah",
                    "Mata Kuliah1",
                    "Mata Kuliah2",
                    "Mata Kuliah3",
                    "Mata Kuliah4"
                  ]),
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
              const CustomDropdown(
                  icon: TablerIcons.empathize,
                  width: 133,
                  items: [
                    "Semua Status",
                    "Status 1",
                    "Status 2",
                    "Status 3",
                    "Status 4"
                  ]),
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
                  return const Center(
                    child: Text("Tidak ada data"),
                  );
                }
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TodayPresensiCard(
                    scheduleWeek: data[0],
                  ),
                );
              },
              orElse: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          },
        ),
        const SizedBox(
          height: 12,
        ),
        const CustomSection(
            title: "Minggu ke-2", child: ContentofWeekPresensi()),
        const SizedBox(
          height: 12,
        ),
        const CustomSection(
            title: "Minggu ke-1", child: ContentofWeekPresensi()),
      ],
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
