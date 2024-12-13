import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:presience_app/presentation/blocs/attendance/attendance_bloc.dart';
import 'package:presience_app/presentation/blocs/attendance_week/attendance_week_bloc.dart';
import 'package:presience_app/presentation/blocs/auth/auth_bloc.dart';
import 'package:presience_app/presentation/blocs/course/course_bloc.dart';
import 'package:presience_app/presentation/blocs/history_attendance/history_attendance_bloc.dart';
import 'package:presience_app/presentation/blocs/permit/permit_bloc.dart';
import 'package:presience_app/presentation/blocs/schedule/schedule_bloc.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/buttons/button.dart';
import 'package:presience_app/presentation/widgets/form/text_field.dart';
import 'package:presience_app/presentation/widgets/login/heading.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final TextEditingController _nimController = TextEditingController();
  List<DateTime?> _birthDate = [null]; // Initialize with nulls
  final TextEditingController _birthDateController = TextEditingController();
  Map<String, String?> errorMessage = {
    "nim": null,
    "birthDate": null,
  };

  void validateForm() {
    setState(() {
      // Validasi password
      if (_nimController.text.isEmpty) {
        errorMessage['nim'] = "Masukkan NIM";
      } else {
        errorMessage['nim'] = null;
      }

      // Validasi konfirmasi password
      if (_birthDateController.text.isEmpty) {
        errorMessage['birthDate'] = "Masukkan Tanggal Lahir";
      } else {
        errorMessage['birthDate'] = null;
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nimController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    await showDialog<List<DateTime?>>(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: neutralTheme,
          child: CalendarDatePicker2(
            value: _birthDate, // Pass the selected dates
            config: CalendarDatePicker2Config(
              dayBuilder: ({
                required date,
                textStyle,
                decoration,
                isSelected,
                isDisabled,
                isToday,
              }) {
                Widget? dayWidget;
                return dayWidget;
              },
              // buttonPadding: const EdgeInsets.all(12),
              dayTextStyle: mediumBodyTextS,
              selectedDayTextStyle:
                  mediumBodyTextS.copyWith(color: neutralTheme),
              calendarType: CalendarDatePicker2Type.single,
              // closeDialogOnOkTapped: true,
              // closeDialogOnCancelTapped: true,
              controlsHeight: 60,
              // firstDate: DateTime.now(),
              lastDate: DateTime.now(), // Set range limits
            ),
            onValueChanged: (dates) {
              // Update the selected dates
              setState(() {
                _birthDate = dates; // Update the selected dates
              });
              _birthDateController.text =
                  DateFormat('dd/MM/yyyy').format(_birthDate[0]!);
              Navigator.of(context).pop(_birthDate);
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: neutralTheme,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LoginHeading(
                heading: "Lupa Kata Sandi",
                subheading:
                    "Masukkan NIM dan Tanggal Lahir untuk mengatur ulang kata sandi.",
              ),
              const SizedBox(
                height: 32,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    label: "NIM",
                    hint: "NIM",
                    controller: _nimController,
                    errorMessage: errorMessage['nim'],
                    onChanged: (value) {
                      setState(() {
                        _nimController.text = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                    label: "Tanggal Lahir",
                    hint: _birthDateController.text == ""
                        ? "DD/MM/YYYY"
                        : _birthDateController.text,
                    readonly: true,
                    errorMessage: errorMessage['birthDate'],
                    readonlyFilled: _birthDateController.text != "",
                    suffix: const Icon(TablerIcons.calendar),
                    onTap: () => _selectDate(context),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LargeFillButton(
                label: "Kirim",
                onPressed: () {
                  validateForm();
                  if (errorMessage.values.every((element) => element == null)) {
                    context.pushReplacement("/login");
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Periksa email Anda untuk mendapatkan Kata Sandi Baru',
                          style: regularBodyTextS.copyWith(color: neutralTheme),
                        ),
                        backgroundColor: orangeTheme[500],
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      ),
                    );
                  }
                }),
            SizedBox(height: 8),
            SmallTextButton(
                label: "Kembali",
                onPressed: () {
                  context.pop();
                })
          ],
        ),
      ),
    ));
  }
}
