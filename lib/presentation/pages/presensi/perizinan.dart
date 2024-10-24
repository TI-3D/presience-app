import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/buttons/button.dart';
import 'package:presience_app/presentation/widgets/cards/perizinan_card.dart';
import 'package:presience_app/presentation/widgets/cards/section.dart';

class PerizinanPage extends StatelessWidget {
  const PerizinanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 12, bottom: 16),
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          width: double.infinity,
          child: Column(
            children: [
              Text("Pengajuan Izin", style: mediumBodyTextXL),
              const SizedBox(
                height: 4,
              ),
              Text(
                "Kamu bisa melakukan pengajuan izin dalam 7 hari sebelum mata kuliah dimulai",
                style: regularBodyText.copyWith(color: neutralTheme[700]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              SmallFillButton(label: "Ajukan Izin", onPressed: () {})
            ],
          ),
        ),
        Divider(
          height: 24,
          thickness: 1,
          color: neutralTheme[100],
        ),
        const CustomSection(title: "Pengajuan", child: ContentofPerizinan()),
        Divider(
          height: 24,
          thickness: 1,
          color: neutralTheme[100],
        ),
        const CustomSection(title: "Perubahan", child: ContentofPerizinan()),
      ],
    );
  }
}

class ContentofPerizinan extends StatefulWidget {
  const ContentofPerizinan({
    super.key,
  });

  @override
  State<ContentofPerizinan> createState() => _ContentofPerizinanState();
}

class _ContentofPerizinanState extends State<ContentofPerizinan> {
  List<Map<String, dynamic>> lastWeekCourses = [
    {
      'courseName': "Pembelajaran Mesin",
      'lectureName': "Amalia Agung Septarina, S.S.M.Tr.TT.",
      'date': "20/10/2024",
      'typePermission': "sakit"
    },
    {
      'courseName': "Metodologi Penelitian",
      'lectureName': "Triana Fatmawati, S.T., M.T.",
      'date': "20/10/2024",
      'typePermission': "izin"
    },
    {
      'courseName': "Pengolahan Citra dan Visi Komputer",
      'lectureName': "Rosa Andrie Asmara, S.T., M.T., Dr. Eng.",
      'date': "20/10/2024",
      'typePermission': "izin"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: lastWeekCourses.length,
      itemBuilder: (context, index) {
        return PerizinanPresensiCard(
          courseName: lastWeekCourses[index]['courseName'],
          lectureName: lastWeekCourses[index]['lectureName'],
          date: lastWeekCourses[index]['date'],
          typePermission: lastWeekCourses[index]['typePermission'],
          onTap: () => context.push('/pengajuan/detail'),
        );
        // return Text(lastWeekCourses[index]['courseName']);
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 8,
      ),
    );
  }
}
