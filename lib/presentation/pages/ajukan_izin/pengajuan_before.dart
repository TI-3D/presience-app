import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart' as path;
import 'package:presience_app/data/dto/requests/permit_before_schedule_dto.dart';
import 'package:presience_app/domain/entities/schedule_week.dart';
import 'package:presience_app/presentation/blocs/history_attendance/history_attendance_bloc.dart';
import 'package:presience_app/presentation/utils/methods.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/buttons/button.dart';
import 'package:presience_app/presentation/widgets/cards/title_section.dart';
import 'package:presience_app/presentation/widgets/form/input_image.dart';
import 'package:presience_app/presentation/widgets/form/label.dart';
import 'package:presience_app/presentation/widgets/form/radio_desc.dart';
import 'package:presience_app/presentation/widgets/form/text_field.dart';
import 'package:presience_app/presentation/widgets/navigations/app_bar.dart';

import '../../blocs/attendance/attendance_bloc.dart';
import '../../blocs/attendance_week/attendance_week_bloc.dart';
import '../../blocs/permit/permit_bloc.dart';
import '../../widgets/modal/button.dart';
import '../../widgets/modal/dialog.dart';
import '../../widgets/modal/loading.dart';

class FormPengajuanBeforeClassPage extends StatefulWidget {
  final String startDate;
  final String endDate;

  const FormPengajuanBeforeClassPage({
    super.key,
    required this.startDate,
    required this.endDate,
  });

  @override
  State<FormPengajuanBeforeClassPage> createState() =>
      _FormPengajuanBeforeClassPageState();
}

class _FormPengajuanBeforeClassPageState
    extends State<FormPengajuanBeforeClassPage> {
  final TextEditingController _descriptionController = TextEditingController();
  String? evidancePhoto;
  String? pathImage;
  String selectedPermission = "sakit";

  // Keep track of the selected options
  final Map<String, bool> _selectedOptions = {};
  final Map<String, int> _selectedScheduleId = {};
  final List<ScheduleWeek> listScheduleWeek = [];

  Map<String, String?> errorMessage = {
    'schedule': null,
    'description': null,
    'document': null,
  };

  validationForm() {
    setState(() {
      if (_selectedScheduleId.isEmpty) {
        errorMessage['schedule'] = "Pilih Semester";
      } else {
        errorMessage['schedule'] = null;
      }

      if (_descriptionController.text.isEmpty) {
        errorMessage['description'] = "Masukkan deskripsi";
      } else {
        errorMessage['description'] = null;
      }

      if (evidancePhoto == null) {
        errorMessage['document'] = "Unggah Gambar";
      } else {
        errorMessage['document'] = null;
      }
    });
  }

  // void _submitForm() {
  //   // Print selected options
  //   final selected = _selectedOptions.entries
  //       .where((entry) => entry.value)
  //       .map((entry) => entry.key)
  //       .toList();
  //   print('Selected options: $selected');
  // }

  @override
  Widget build(BuildContext context) {
    ImageProvider imageProvider;
    if (evidancePhoto == null || evidancePhoto == '') {
      imageProvider = const AssetImage('assets/images/user-profile.png');
    } else if (evidancePhoto!.startsWith('http') ||
        evidancePhoto!.startsWith('https')) {
      imageProvider = NetworkImage(evidancePhoto!);
    } else {
      imageProvider = FileImage(File(evidancePhoto!));
    }

    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        context.read<AttendanceWeekBloc>().add(
              const AttendanceWeekEvent.getHistoryAttendanceWeek(),
            );
        GoRouter.of(context).pop();
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: neutralTheme,
          appBar: CustomAppBar(
            title: "Pengajuan",
            onTap: () {
              context.read<AttendanceWeekBloc>().add(
                    const AttendanceWeekEvent.getHistoryAttendanceWeek(),
                  );
              GoRouter.of(context).pop();
            },
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 12, bottom: 16),
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        TablerIcons.calendar,
                        size: 18,
                        color: blackTheme,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "${convertToLongDateFormat(widget.startDate)} - ${convertToLongDateFormat(widget.endDate)}",
                        style: mediumBodyText,
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: neutralTheme[100],
                  height: 24,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleSection(title: "Detail Perizinan"),
                      const SizedBox(
                        height: 8,
                      ),
                      const FieldLabel(label: "Mata Kuliah"),
                      const SizedBox(height: 8),
                      BlocBuilder<AttendanceWeekBloc, AttendanceWeekState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            success: (data) {
                              // Initialize _selectedOptions if it's empty
                              if (_selectedOptions.isEmpty) {
                                for (ScheduleWeek item in data) {
                                  if (item.attendance == null) {
                                    listScheduleWeek.add(item);

                                    // Set initial state (e.g., true for selected)
                                    _selectedOptions[
                                        item.schedule!.course!.name!] = true;
                                    _selectedScheduleId[item
                                        .schedule!.course!.name!] = item.id!;
                                  }
                                }
                              }

                              return Column(
                                children: listScheduleWeek.map<Widget>(
                                  (item) {
                                    BorderRadius borderRadius;
                                    if (item == listScheduleWeek[0]) {
                                      borderRadius =
                                          const BorderRadius.vertical(
                                              top: Radius.circular(8));
                                    } else if (item ==
                                        listScheduleWeek[
                                            listScheduleWeek.length - 1]) {
                                      borderRadius =
                                          const BorderRadius.vertical(
                                              bottom: Radius.circular(8));
                                    } else {
                                      borderRadius = BorderRadius.zero;
                                    }

                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          final isSelected = !_selectedOptions[
                                              item.schedule!.course!.name!]!;
                                          _selectedOptions[item.schedule!
                                              .course!.name!] = isSelected;

                                          // Update _selectedScheduleId based on selection
                                          if (isSelected) {
                                            _selectedScheduleId[item.schedule!
                                                .course!.name!] = item.id!;
                                          } else {
                                            _selectedScheduleId.remove(
                                                item.schedule!.course!.name!);
                                          }
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          borderRadius: borderRadius,
                                          border: Border(
                                            right: BorderSide(
                                                color: neutralTheme[100]!,
                                                width: 1),
                                            left: BorderSide(
                                                color: neutralTheme[100]!,
                                                width: 1),
                                            top: item == listScheduleWeek[0]
                                                ? BorderSide(
                                                    color: neutralTheme[100]!,
                                                    width: 1)
                                                : BorderSide.none,
                                            bottom: BorderSide(
                                                color: neutralTheme[100]!,
                                                width: 1),
                                          ),
                                          color: _selectedOptions[
                                                  item.schedule!.course!.name!]!
                                              ? purpleTheme[100]
                                              : neutralTheme,
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              _selectedOptions[item
                                                      .schedule!.course!.name!]!
                                                  ? TablerIcons.square_check
                                                  : TablerIcons.square,
                                              color: _selectedOptions[item
                                                      .schedule!.course!.name!]!
                                                  ? purpleTheme
                                                  : blackTheme,
                                              size: 18,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              item.schedule!.course!.name!,
                                              style: mediumBodyText.copyWith(
                                                color: _selectedOptions[item
                                                        .schedule!
                                                        .course!
                                                        .name!]!
                                                    ? purpleTheme
                                                    : blackTheme,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ).toList(), // Convert map to List<Widget>
                              );
                            },
                            orElse: () {
                              return const SizedBox();
                            },
                          );
                        },
                      ),
                      if (errorMessage['schedule'] != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            errorMessage['schedule']!,
                            style: mediumBodyTextS.copyWith(color: redTheme),
                          ),
                        ),
                      if (errorMessage['schedule'] == null)
                        const SizedBox(
                          height: 16,
                        ),
                      const SizedBox(
                        height: 8,
                      ),
                      const FieldLabel(label: "Jenis Izin"),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CustomRadioDesc(
                              value: "sakit",
                              description:
                                  "Kalau sakit, kamu butuh menyertakan surat dokter",
                              isSelected: selectedPermission == "sakit",
                              onTap: () {
                                setState(() {
                                  selectedPermission = "sakit";
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: CustomRadioDesc(
                              value: "izin",
                              description: "Kamu bisa menggunakan surat apapun",
                              isSelected: selectedPermission == "izin",
                              onTap: () {
                                setState(() {
                                  selectedPermission = "izin";
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextField(
                                label: 'Deskripsi',
                                hint: 'Deskripsi',
                                isMultiline: true,
                                errorMessage: errorMessage['description'],
                                controller: _descriptionController,
                                onChanged: (value) {
                                  setState(() {
                                    _descriptionController.text = value;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dokumen',
                              style: mediumBodyText,
                            ),
                            const SizedBox(height: 8),
                            InkWell(
                              onTap: () async {
                                final image = await selectImage();
                                setState(() {
                                  evidancePhoto = image!.path;
                                  pathImage = path.basename(image.path);
                                });
                              },
                              child: (evidancePhoto != null)
                                  ? CustomImageInputFill(
                                      imageProvider: imageProvider,
                                      pathImage: pathImage)
                                  : CustomImageInputEmpty(
                                      errorMessage: errorMessage['document'],
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar:
              BlocConsumer<HistoryAttendanceBloc, HistoryAttendanceState>(
            listener: (context, state) {
              state.maybeWhen(
                success: (data) {
                  Navigator.of(context, rootNavigator: true).pop();
                  context.read<AttendanceBloc>().add(
                        const AttendanceEvent.getAttendanceInformation(),
                      );
                  context.read<AttendanceWeekBloc>().add(
                        const AttendanceWeekEvent.getHistoryAttendanceWeek(),
                      );
                  context.read<PermitBloc>().add(
                        const PermitEvent.getHistoryPermit(),
                      );
                  context.go('/homepage');
                },
                failure: (message) {
                  Navigator.of(context, rootNavigator: true).pop();
                  showCustomDialog(
                    isLoading: true,
                    context,
                    child: CustomDialog(
                      child: DialogContentButton(
                        title: "Gagal Mengajukan Izin",
                        subtitle: message,
                        label: "Ulangi",
                        onPressed: () {
                          context.pop();
                        },
                      ),
                    ),
                  );
                },
                loading: () {
                  showCustomDialog(
                    isLoading: true,
                    context,
                    child: const CustomDialog(
                      child: DialogContentLoading(
                        title: "Tunggu sebentar",
                        subtitle: "Izin kamu sedang diproses",
                      ),
                    ),
                  );
                },
                orElse: () {},
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => Container(
                  padding:
                      const EdgeInsets.only(bottom: 16, right: 16, left: 16),
                  child: LargeFillButton(
                    label: "Konfirmasi",
                    isDisabled: _descriptionController.text.isEmpty ||
                        evidancePhoto == null ||
                        _selectedScheduleId.values.isEmpty,
                    onPressed: () {
                      validationForm();
                      if (errorMessage["schedule"] == null &&
                          errorMessage['description'] == null &&
                          errorMessage['document'] == null) {
                        context.read<HistoryAttendanceBloc>().add(
                              HistoryAttendanceEvent.storePermitBeforeSchedule(
                                PermitBeforeScheduleDto(
                                  description: _descriptionController.text,
                                  evidence: File(evidancePhoto!),
                                  type: selectedPermission,
                                  startDate:
                                      convertDateRequest(widget.startDate),
                                  endDate: convertDateRequest(widget.endDate),
                                  scheduleWeekId:
                                      _selectedScheduleId.values.toList(),
                                ),
                              ),
                            );
                      }
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
