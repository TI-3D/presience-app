import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:presience_app/data/dto/requests/auth_dto.dart';
import 'package:presience_app/presentation/blocs/auth/auth_bloc.dart';
import 'package:presience_app/presentation/blocs/schedule/schedule_bloc.dart';
import 'package:presience_app/presentation/pages/presensi/presensi.dart';
import 'package:presience_app/presentation/pages/profile/profile.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/cards/card.dart';
import 'package:presience_app/presentation/widgets/cards/attendance.dart';
import 'package:presience_app/presentation/widgets/cards/last_week_card.dart';
import 'package:presience_app/presentation/widgets/cards/section.dart';
import 'package:presience_app/presentation/widgets/cards/title_section.dart';
import 'package:presience_app/presentation/widgets/cards/today_presensi.dart';
import 'package:presience_app/presentation/widgets/navigations/menu_item.dart';
import 'package:presience_app/presentation/widgets/skeletons/attendance.dart';
import 'package:presience_app/presentation/widgets/skeletons/last_week_skeleton.dart';
import 'package:presience_app/presentation/widgets/skeletons/today_presensi_skeleton.dart';

class NavigationHomePage extends StatefulWidget {
  const NavigationHomePage({super.key});

  @override
  State<NavigationHomePage> createState() => _NavigationHomePageState();
}

class _NavigationHomePageState extends State<NavigationHomePage> {
  int _selectedPageIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = <Widget>[
      const HomePage(),
      const TabPresensiPage(),
      const ProfilPage(),
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: neutralTheme,
        body: pages[_selectedPageIndex],
        bottomNavigationBar: Container(
          height: 72,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: neutralTheme[200]!, width: 1.5),
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
                  selectedPageIndex: _selectedPageIndex,
                  onTap: _onItemTapped),
              CustomButtomNavigationMenuItem(
                  label: "Presensi",
                  icon: TablerIcons.news,
                  index: 1,
                  selectedPageIndex: _selectedPageIndex,
                  onTap: _onItemTapped),
              CustomButtomNavigationMenuItem(
                  label: "Profil",
                  icon: TablerIcons.user_circle,
                  index: 2,
                  selectedPageIndex: _selectedPageIndex,
                  onTap: _onItemTapped),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
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
                                : Image.asset(
                                    'assets/default/Men-Avatar-Default.png',
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
                    return const Center(
                      child: CircularProgressIndicator(),
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
                      return AttendanceCard(
                        data: data,
                      );
                    },
                    orElse: () {
                      return AttendanceSkeleton();
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
                        child: TitleSection(title: "Hari Ini")),
                    const SizedBox(
                      height: 8,
                    ),
                    const ContentofHariIni2(),
                  ]),
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
            const CustomSection(
                title: "Riwayat Presensi", child: ContentofRiwayatPresensi()),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      )
    ]);
  }
}

class ContentofRiwayatPresensi extends StatefulWidget {
  const ContentofRiwayatPresensi({
    super.key,
  });

  @override
  State<ContentofRiwayatPresensi> createState() =>
      _ContentofRiwayatPresensiState();
}

class _ContentofRiwayatPresensiState extends State<ContentofRiwayatPresensi> {
  List<Map<String, dynamic>> lastWeekCourses = [
    {
      'courseName': "Pembelajaran Mesin",
      'lectureName': "Amalia Agung Septarina, S.S.M.Tr.TT.",
      'courseTime': 6,
      'alpha': 6,
      'izin': 0,
      'sakit': 0,
    },
    {
      'courseName': "Metodologi Penelitian",
      'lectureName': "Triana Fatmawati, S.T., M.T.",
      'courseTime': 4,
      'alpha': 0,
      'izin': 0,
      'sakit': 4,
    },
    {
      'courseName': "Pengolahan Citra dan Visi Komputer",
      'lectureName': "Rosa Andrie Asmara, S.T., M.T., Dr. Eng.",
      'courseTime': 6,
      'alpha': 0,
      'izin': 1,
      'sakit': 0,
    },
    {
      'courseName': "Administrasi dan Keamanan Jaringan",
      'lectureName': "Yuri Ariyanto, S.Kom., M.Kom.",
      'courseTime': 4,
      'alpha': 0,
      'izin': 4,
      'sakit': 0,
    },
    {
      'courseName': "Bahasa Inggris Persiapan Kerja",
      'lectureName': "Atiqah Nurul Asri, S.Pd., M.Pd.",
      'courseTime': 4,
      'alpha': 0,
      'izin': 0,
      'sakit': 0,
    },
    {
      'courseName': "Kewirausahaan",
      'lectureName': "Hendra Pradibta, SE., M.Sc.",
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
        // return CustomLastWeekSkeleton();
        return CustomLastWeekCard(
          courseName: lastWeekCourses[index]['courseName'],
          lectureName: lastWeekCourses[index]['lectureName'],
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

class ContentofHariIni2 extends StatefulWidget {
  const ContentofHariIni2({
    super.key,
  });

  @override
  State<ContentofHariIni2> createState() => _ContentofHariIni2State();
}

class _ContentofHariIni2State extends State<ContentofHariIni2> {
  final Map<String, String> matkul1 = {
    'courseName': "Nama Mata Kuliah 1",
    'lectureName': "Nama Dosen 1 S.Kom., M.Kom",
    'status': "hadir",
    'room': "RUANG",
    'floor': "6",
    'startTime': "00:00",
    'endTime': "00:00",
    'absentPercentage': "00"
  };
  final Map<String, String> matkul2 = {
    'courseName': "Nama Mata Kuliah 2",
    'lectureName': "Nama Dosen 2 S.Kom., M.Kom",
    'status': "nonActive",
    'room': "RUANG",
    'floor': "6",
    'startTime': "00:00",
    'endTime': "00:00",
    'absentPercentage': "00"
  };

  late final List<Map<String, String>> matkulList = [matkul1, matkul2];

  int currentCard = 0;

  Widget indicator(int index) {
    return Container(
      margin: EdgeInsets.only(right: index < matkulList.length - 1 ? 4.0 : 0),
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
            if (data.isEmpty) {
              return const Center(
                child: Text("Tidak ada data"),
              );
            }
            return Column(
              children: [
                CarouselSlider.builder(
                  itemCount: data.length,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width -
                          32, // 80% of screen width
                      child:
                          //  TodayPresensiSkeleton()
                          TodayPresensiCard(
                        scheduleWeek: data[itemIndex],
                        onTapPresensi: () {
                          context.push('/camera/presensi');
                        },
                        onTapAjukanIzin: () {
                          context.push('/pengajuan_izin/during');
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
                      return indicator(index);
                    }),
                  )
                ]
              ],
            );
          },
          orElse: () {
            return Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TodayPresensiSkeleton());
          },
        );
      },
    );
  }
}
