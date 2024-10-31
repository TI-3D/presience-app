import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:presience_app/data/dto/requests/attendance_dto.dart';
import 'package:presience_app/presentation/blocs/attendance_week/attendance_week_bloc.dart';
import 'package:presience_app/presentation/blocs/schedule/schedule_bloc.dart';
import 'package:presience_app/presentation/utils/methods.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/buttons/button.dart';
import 'package:presience_app/presentation/widgets/cameras/camera_buttons.dart';
import 'package:presience_app/presentation/widgets/cameras/camera_full.dart';
import 'package:presience_app/presentation/widgets/cards/title_section.dart';
import 'package:presience_app/presentation/widgets/containers/button_sheet.dart';
import 'package:presience_app/presentation/widgets/form/input_image.dart';
import 'package:presience_app/presentation/widgets/form/label.dart';
import 'package:presience_app/presentation/widgets/form/text_field.dart';
import 'package:presience_app/presentation/widgets/modal/button.dart';
import 'package:presience_app/presentation/widgets/modal/dialog.dart';
import 'package:presience_app/presentation/widgets/modal/loading.dart';

import '../../blocs/attendance/attendance_bloc.dart';

class CameraPresensiPage extends StatefulWidget {
  final String? openedAt;
  final int? scheduleWeekId;

  const CameraPresensiPage({
    super.key,
    this.openedAt,
    this.scheduleWeekId,
  });

  @override
  State<CameraPresensiPage> createState() => _CameraPresensiPageState();
}

class _CameraPresensiPageState extends State<CameraPresensiPage> {
  AttendanceDto? _attendanceDto;
  late CameraController controller;
  int _currentCameraIndex = 0;
  bool isLate = false;

  Future<void> initializeController() async {
    List<CameraDescription> cameras = await availableCameras();
    controller = CameraController(
        cameras[_currentCameraIndex], ResolutionPreset.ultraHigh);
    await controller.initialize();
  }

  @override
  void initState() {
    // Check if 'openedAt' is more than 15 minutes from current time
    if (widget.openedAt != null) {
      final now = DateTime.now();
      final openedTime = DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(widget.openedAt!.split(':')[0]),
        int.parse(widget.openedAt!.split(':')[1]),
        int.parse(widget.openedAt!.split(':')[2]),
      );
      final difference = now.difference(openedTime);

      if (difference > const Duration(minutes: 15)) {
        isLate = true;
      }
    }

    super.initState();
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => FormLate(
        onSubmit: (attendanceDto) {
          _attendanceDto = attendanceDto;
        },
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<File?> takePicture() async {
    Directory tempDir = await getTemporaryDirectory();
    String directoryPath = '${tempDir.path}/images/takePicture';
    await Directory(directoryPath).create(recursive: true);
    String filePath = '$directoryPath/image.jpg';
    try {
      await controller.takePicture();
    } catch (e) {
      return null;
    }

    return File(filePath);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: initializeController(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // Tampilkan bottom sheet hanya sekali setelah kamera diinisialisasi
              if (isLate) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _showBottomSheet();
                  setState(() {
                    isLate = false; // Set agar tidak tampil lagi
                  });
                });
              }
              return Stack(
                children: [
                  CameraFullRatio(controller: controller),
                  BlocConsumer<ScheduleBloc, ScheduleState>(
                    listener: (context, state) {
                      state.maybeWhen(
                        success: (data) {
                          context.read<AttendanceBloc>().add(
                                const AttendanceEvent
                                    .getAttendanceInformation(),
                              );
                          context.read<AttendanceWeekBloc>().add(
                                const AttendanceWeekEvent
                                    .getHistoryAttendanceWeek(),
                              );
                          return context.push('/homepage');
                        },
                        failure: (message) {
                          showCustomDialog(
                            context,
                            child: CustomDialog(
                              child: DialogContentButton(
                                title:
                                    "Wajah Tidak Dikenali / Lokasi Tidak Valid",
                                subtitle:
                                    "Kami tidak dapat mengenali wajahmu. / Sepertinya kamu sedang tidak di kampus.",
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
                          return CameraButtons(
                            onTapCamera: () {
                              context.read<ScheduleBloc>().add(
                                    ScheduleEvent.storeAttendance(
                                      AttendanceDto(
                                        scheduleWeekId: widget.scheduleWeekId!,
                                        description:
                                            _attendanceDto?.description,
                                        evidence: _attendanceDto?.evidence,
                                      ),
                                    ),
                                  );
                            },
                            onTapRotateCamera: () {
                              setState(() {
                                _currentCameraIndex =
                                    _currentCameraIndex == 0 ? 1 : 0;
                              });
                            },
                            onTapBack: () {
                              GoRouter.of(context).pop();
                              context
                                  .read<ScheduleBloc>()
                                  .add(const ScheduleEvent.getSchedulesToday());
                            },
                          );
                        },
                        loading: () {
                          return const CustomDialog(
                            child: DialogContentLoading(
                              title: "Tunggu sebentar",
                              subtitle: "Wajah kamu sedang di proses",
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              );
            } else {
              return Container(color: Colors.black); // Menunggu inisialisasi
            }
          },
        ),
      ),
    );
  }
}

class FormLate extends StatefulWidget {
  final void Function(AttendanceDto attendanceDto) onSubmit;

  const FormLate({
    super.key,
    required this.onSubmit,
  });

  @override
  State<FormLate> createState() => _FormLateState();
}

class _FormLateState extends State<FormLate> {
  final TextEditingController _descriptionController = TextEditingController();
  AttendanceDto? _attendanceDto;
  String? evidancePhoto;
  String? pathImage;

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

    return CustomButtomSheet(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TitleSection(title: "Keterlambatan"),
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: Icon(
                    TablerIcons.x,
                    size: 24,
                    color: neutralTheme[200],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            CustomTextField(
              label: "Deskripsi",
              hint: "Deskripsi",
              controller: _descriptionController,
              isMultiline: true,
            ),
            const SizedBox(
              height: 8,
            ),
            const FieldLabel(label: "Dokumen"),
            const SizedBox(
              height: 8,
            ),
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
                        imageProvider: imageProvider, pathImage: pathImage)
                    : const CustomImageInputEmpty()),
            const SizedBox(
              height: 28,
            ),
            LargeFillButton(
              label: "Lanjut",
              onPressed: () {
                _attendanceDto = AttendanceDto(
                  description: _descriptionController.text,
                  evidence: File(evidancePhoto!),
                );
                widget.onSubmit(_attendanceDto!);
                context.pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
