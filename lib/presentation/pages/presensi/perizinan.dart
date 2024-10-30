import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/buttons/button.dart';
import 'package:presience_app/presentation/widgets/cards/perizinan_card.dart';
import 'package:presience_app/presentation/widgets/cards/section.dart';
import 'package:presience_app/presentation/widgets/cards/title_section.dart';
import 'package:presience_app/presentation/widgets/containers/button_sheet.dart';
import 'package:presience_app/presentation/widgets/empty_state/types/empty_pengajuan_izin.dart';
import 'package:presience_app/presentation/widgets/form/text_field.dart';

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
              //EMPTY STATE
              // EmptyAjukanIzin(),
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
              SmallFillButton(
                  label: "Ajukan Izin",
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: modalBackground,
                      builder: (BuildContext context) {
                        return const FormDate();
                      },
                    );
                  })
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

class FormDate extends StatefulWidget {
  const FormDate({
    super.key,
  });

  @override
  State<FormDate> createState() => _FormDateState();
}

class _FormDateState extends State<FormDate> {
  List<DateTime?> _dates = [null, null]; // Initialize with nulls
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  Future<void> _selectDateRange(BuildContext context) async {
    final List<DateTime?>? picked = await showDialog<List<DateTime?>>(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: neutralTheme,
          child: CalendarDatePicker2WithActionButtons(
            value: _dates, // Pass the selected dates
            config: CalendarDatePicker2WithActionButtonsConfig(
              dayBuilder: ({
                required date,
                textStyle,
                decoration,
                isSelected,
                isDisabled,
                isToday,
              }) {
                Widget? dayWidget;
                print(date.weekday);
                if (date.weekday == 7 || date.weekday == 6) {
                  dayWidget = Container(
                    decoration: decoration,
                    child: Center(
                      child: Text(
                        MaterialLocalizations.of(context)
                            .formatDecimal(date.day),
                        style: textStyle?.copyWith(
                            color: isDisabled! || isSelected!
                                ? isSelected!
                                    ? neutralTheme
                                    : redTheme[300]
                                : redTheme),
                      ),
                    ),
                  );
                }
                return dayWidget;
              },
              buttonPadding: const EdgeInsets.all(12),
              dayTextStyle: mediumBodyTextS,
              selectedDayTextStyle:
                  mediumBodyTextS.copyWith(color: neutralTheme),
              calendarType: CalendarDatePicker2Type.range,
              closeDialogOnOkTapped: true,
              closeDialogOnCancelTapped: true,
              controlsHeight: 60,
              firstDate: DateTime.now(),
              lastDate: DateTime.now()
                  .add(const Duration(days: 6)), // Set range limits
            ),
            onOkTapped: () {
              // Memastikan dialog menutup dan mengembalikan nilai ketika OK ditekan
              Navigator.of(context)
                  .pop(_dates); // Menutup dialog dan mengembalikan nilai
            },
            onCancelTapped: () {
              // Menutup dialog tanpa mengembalikan nilai
              Navigator.of(context).pop(); // Hanya menutup dialog
            },
            onValueChanged: (dates) {
              // Update the selected dates
              setState(() {
                _dates = dates; // Update the selected dates
              });

              // Check if the dates list has the expected values
              if (_dates.isNotEmpty) {
                String startDate = _dates[0] != null
                    ? DateFormat('dd/MM/yyyy').format(_dates[0]!)
                    : '';
                _startDateController.text = startDate;

                if (_dates.length > 1 && _dates[1] != null) {
                  String endDate = DateFormat('dd/MM/yyyy').format(_dates[1]!);
                  _endDateController.text = endDate;
                } else {
                  // Reset end date if no end date is selected
                  _endDateController.text = '';
                }
              }
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomButtomSheet(
      child: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const TitleSection(title: "Tanggal yang diajukan"),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                label: "Tanggal Awal",
                hint: _startDateController.text == ""
                    ? "DD/MM/YYYY"
                    : _startDateController.text,
                readonly: true,
                readonlyFilled: _startDateController.text != "",
                suffix: const Icon(TablerIcons.calendar),
                onTap: () => _selectDateRange(context),
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(
                label: "Tanggal Akhir",
                isOptional: true,
                hint: _endDateController.text == ""
                    ? "DD/MM/YYYY"
                    : _endDateController.text,
                readonly: true,
                readonlyFilled: _endDateController.text != "",
                suffix: const Icon(TablerIcons.calendar),
                onTap: () => _selectDateRange(context),
              ),
              const SizedBox(
                height: 28,
              ),
              LargeFillButton(
                  label: "Lanjut",
                  onPressed: () {
                    context.pop();
                    context.push('/pengajuan_izin');
                  })
            ]),
      ),
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
        // PerizinanPresensiSkeleton();
        // return Text(lastWeekCourses[index]['courseName']);
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 8,
      ),
    );
  }
}
