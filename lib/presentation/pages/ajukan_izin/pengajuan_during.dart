import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart' as path;
import 'package:presience_app/domain/entities/schedule_week.dart';
import 'package:presience_app/presentation/blocs/permit/permit_bloc.dart';
import 'package:presience_app/presentation/blocs/schedule/schedule_bloc.dart';
import 'package:presience_app/presentation/utils/methods.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/buttons/button.dart';
import 'package:presience_app/presentation/widgets/cards/section.dart';
import 'package:presience_app/presentation/widgets/cards/title_section.dart';
import 'package:presience_app/presentation/widgets/containers/content.dart';
import 'package:presience_app/presentation/widgets/containers/detail.dart';
import 'package:presience_app/presentation/widgets/form/input_image.dart';
import 'package:presience_app/presentation/widgets/form/label.dart';
import 'package:presience_app/presentation/widgets/form/radio_desc.dart';
import 'package:presience_app/presentation/widgets/form/text_field.dart';
import 'package:presience_app/presentation/widgets/navigations/app_bar.dart';

import '../../../data/dto/requests/get_history_attendance_dto.dart';
import '../../../data/dto/requests/permit_dto.dart';
import '../../blocs/attendance/attendance_bloc.dart';
import '../../blocs/attendance_week/attendance_week_bloc.dart';
import '../../blocs/history_attendance/history_attendance_bloc.dart';
import '../../widgets/modal/button.dart';
import '../../widgets/modal/dialog.dart';
import '../../widgets/modal/loading.dart';

class FormPengajuanDuringClassPage extends StatefulWidget {
  final ScheduleWeek scheduleWeek;
  const FormPengajuanDuringClassPage({
    super.key,
    required this.scheduleWeek,
  });

  @override
  State<FormPengajuanDuringClassPage> createState() =>
      _FormPengajuanDuringClassPageState();
}

class _FormPengajuanDuringClassPageState
    extends State<FormPengajuanDuringClassPage> {
  final TextEditingController _descriptionController = TextEditingController();
  String? evidancePhoto;
  String? pathImage;
  String selectedPermission = "sakit";

  @override
  void dispose() {
    super.dispose();

    _descriptionController.dispose();
  }

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

    return SafeArea(
      child: Scaffold(
        backgroundColor: neutralTheme,
        appBar: CustomAppBar(
          title: "Pengajuan",
          onTap: () {
            GoRouter.of(context).pop();
            context.read<ScheduleBloc>().add(
                  const ScheduleEvent.getSchedulesToday(),
                );
          },
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(top: 12, bottom: 16),
              child: Column(
                children: [
                  CustomSection(
                    title: "Detail Presensi",
                    child: Column(
                      children: [
                        CustomFirstDetailContainer(
                          children: [
                            const TitleDetail(title: "Mata Kuliah"),
                            ValueDetail(
                              content:
                                  widget.scheduleWeek.schedule!.course!.name!,
                            )
                          ],
                        ),
                        CustomMiddleDetailContainer(
                          children: [
                            const TitleDetail(title: "Minggu"),
                            ValueDetail(
                              content:
                                  widget.scheduleWeek.schedule!.week!.name!,
                            )
                          ],
                        ),
                        CustomLastDetailContainer(
                          children: [
                            const TitleDetail(title: "Tanggal"),
                            ValueDetail(
                              content:
                                  getFormattedDate(widget.scheduleWeek.date!),
                            )
                          ],
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
                                description:
                                    "Kamu bisa menggunakan surat apapun",
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
                                  controller: _descriptionController,
                                  onChanged: (value) {
                                    setState(() {
                                      _descriptionController.text = value;
                                    });
                                  },
                                  errorMessage:
                                      (_descriptionController.text.isEmpty)
                                          ? 'Masukkan deskripsi'
                                          : null,
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 8),
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
                              : const CustomImageInputEmpty(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<ScheduleBloc, ScheduleState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return Container();
                  },
                  loading: () {
                    return const CustomDialog(
                      child: DialogContentLoading(
                        title: "Tunggu sebentar",
                        subtitle: "Izin kamu sedang di proses",
                      ),
                    );
                  },
                );
              },
            )
          ],
        ),
        bottomNavigationBar: BlocConsumer<ScheduleBloc, ScheduleState>(
          listener: (context, state) {
            state.maybeWhen(
              success: (data) {
                context.read<AttendanceBloc>().add(
                      const AttendanceEvent.getAttendanceInformation(),
                    );
                context.read<AttendanceWeekBloc>().add(
                      const AttendanceWeekEvent.getHistoryAttendanceWeek(),
                    );
                context.read<PermitBloc>().add(
                      const PermitEvent.getHistoryPermit(),
                    );
                context.read<HistoryAttendanceBloc>().add(
                      const HistoryAttendanceEvent.getHistoryAttendance(
                        GetHistoryAttendanceDto(
                            attendanceStatus: '', courseId: 0),
                      ),
                    );
                context
                    .read<ScheduleBloc>()
                    .add(const ScheduleEvent.startPolling());
                return context.go('/homepage');
              },
              failure: (message) {
                showCustomDialog(
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
              orElse: () {},
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return Container(
                  padding:
                      const EdgeInsets.only(bottom: 16, right: 16, left: 16),
                  child: LargeFillButton(
                    label: "Konfirmasi",
                    onPressed: () {
                      context
                          .read<ScheduleBloc>()
                          .add(const ScheduleEvent.stopPolling());
                      context.read<ScheduleBloc>().add(
                            ScheduleEvent.storeCurrentPermit(
                              PermitDto(
                                scheduleWeekId: widget.scheduleWeek.id!,
                                type: selectedPermission,
                                description: _descriptionController.text,
                                evidence: File(evidancePhoto!),
                              ),
                            ),
                          );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
