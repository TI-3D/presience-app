import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:location/location.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:presience_app/data/dto/requests/attendance_dto.dart';
import 'package:presience_app/presentation/blocs/attendance_week/attendance_week_bloc.dart';
import 'package:presience_app/presentation/blocs/face_recognition/face_recognition_bloc.dart';
import 'package:presience_app/presentation/blocs/schedule/schedule_bloc.dart';
import 'package:presience_app/presentation/utils/methods.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/buttons/button.dart';
import 'package:presience_app/presentation/widgets/cameras/camera_buttons.dart';
import 'package:presience_app/presentation/widgets/cameras/camera_frame.dart';
import 'package:presience_app/presentation/widgets/cameras/camera_full.dart';
import 'package:presience_app/presentation/widgets/cards/title_section.dart';
import 'package:presience_app/presentation/widgets/containers/button_sheet.dart';
import 'package:presience_app/presentation/widgets/form/input_image.dart';
import 'package:presience_app/presentation/widgets/form/label.dart';
import 'package:presience_app/presentation/widgets/form/text_field.dart';
import 'package:presience_app/presentation/widgets/modal/button.dart';
import 'package:presience_app/presentation/widgets/modal/dialog.dart';
import 'package:presience_app/presentation/widgets/modal/loading.dart';

import '../../../data/dto/requests/get_history_attendance_dto.dart';
import '../../blocs/attendance/attendance_bloc.dart';
import '../../blocs/history_attendance/history_attendance_bloc.dart';

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
  bool _showPicture = false;
  File? fileImage;

  double? latitude;
  double? longitude;
  bool _locationRetrieved = false;

  Future<void> getCurrentPosition() async {
    try {
      Location location = Location();

      bool serviceEnabled;
      PermissionStatus permissionGranted;
      LocationData locationData;

      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          return;
        }
      }

      permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      locationData = await location.getLocation();
      latitude = locationData.latitude;
      longitude = locationData.longitude;

      setState(() {
        _locationRetrieved = true;
      });
    } on PlatformException catch (e) {
      if (e.code == 'IO_ERROR') {
        debugPrint(
            'A network error occurred trying to lookup the supplied coordinates: ${e.message}');
      } else {
        debugPrint('Failed to lookup coordinates: ${e.message}');
      }
    } catch (e) {
      debugPrint('An unknown error occurred: $e');
    }
  }

  Future<void> initializeController() async {
    List<CameraDescription> cameras = await availableCameras();
    controller = CameraController(
        cameras[_currentCameraIndex], ResolutionPreset.ultraHigh);
    await controller.initialize();
  }

  @override
  void initState() {
    Future.microtask(() async {
      await getCurrentPosition();
    });

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
      XFile picture = await controller.takePicture();
      File file = File(picture.path);
      fileImage = file;
      return file.copy(filePath);
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _locationRetrieved
            ? FutureBuilder(
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
                        if (_showPicture) ...[
                          Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()..scale(-1.0, 1.0),
                            child: Image.file(
                              fileImage!,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                        const CameraFrame(),
                        BlocListener<FaceRecognitionBloc, FaceRecognitionState>(
                          listener: (context, state) {
                            state.maybeWhen(
                              success: (message) {
                                context.read<ScheduleBloc>().add(
                                      ScheduleEvent.storeAttendance(
                                        AttendanceDto(
                                          scheduleWeekId:
                                              widget.scheduleWeekId!,
                                          description:
                                              _attendanceDto?.description,
                                          evidence: _attendanceDto?.evidence,
                                          latitude: latitude,
                                          longitude: longitude,
                                        ),
                                      ),
                                    );
                              },
                              failure: (message) {
                                showCustomDialog(
                                  isLoading: true,
                                  context,
                                  child: CustomDialog(
                                    child: DialogContentButton(
                                      title: "Wajah Tidak Dikenali",
                                      subtitle:
                                          "Kami tidak dapat mengenali wajahmu.",
                                      label: "Ulangi",
                                      onPressed: () {
                                        setState(() {
                                          _showPicture = false;
                                        });
                                        context.pop();
                                      },
                                    ),
                                  ),
                                );
                              },
                              orElse: () {},
                            );
                          },
                          child: BlocConsumer<ScheduleBloc, ScheduleState>(
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
                                  context.read<HistoryAttendanceBloc>().add(
                                        const HistoryAttendanceEvent
                                            .getHistoryAttendance(
                                          GetHistoryAttendanceDto(
                                              attendanceStatus: '',
                                              courseId: 0),
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
                                    isLoading: true,
                                    child: CustomDialog(
                                      child: DialogContentButton(
                                        title: "Lokasi Tidak Valid",
                                        subtitle:
                                            "Sepertinya kamu sedang tidak di kampus.",
                                        label: "Ulangi",
                                        onPressed: () {
                                          setState(() {
                                            _showPicture = false;
                                          });
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
                                    onTapCamera: () async {
                                      context.read<ScheduleBloc>().add(
                                          const ScheduleEvent.stopPolling());
                                      File? picture = await takePicture();
                                      if (picture != null) {
                                        setState(() {
                                          _showPicture = true;
                                        });
                                        context.read<FaceRecognitionBloc>().add(
                                            FaceRecognitionEvent.validateFace(
                                                picture));
                                      }
                                    },
                                    onTapRotateCamera: () {
                                      setState(() {
                                        _currentCameraIndex =
                                            _currentCameraIndex == 0 ? 1 : 0;
                                      });
                                    },
                                    onTapBack: () {
                                      GoRouter.of(context).pop();
                                      context.read<ScheduleBloc>().add(
                                          const ScheduleEvent
                                              .getSchedulesToday());
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
                        ),
                        BlocBuilder<FaceRecognitionBloc, FaceRecognitionState>(
                          builder: (context, state) {
                            return state.maybeWhen(
                              loading: () {
                                return const CustomDialog(
                                  child: DialogContentLoading(
                                    title: "Tunggu sebentar",
                                    subtitle:
                                        "Kami sedang mengenali wajah kamu",
                                  ),
                                );
                              },
                              orElse: () {
                                return Container();
                              },
                            );
                          },
                        ),
                      ],
                    );
                  } else {
                    return Container(
                        color: Colors.black); // Menunggu inisialisasi
                  }
                },
              )
            : const CustomDialog(
                child: DialogContentLoading(
                  title: "Tunggu sebentar",
                  subtitle: "Kami sedang mengambil lokasi kamu",
                ),
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

  Map<String, String?> errorMessage = {
    'description': null,
    'document': null,
  };

  void validationForm() {
    setState(() {
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
      child: SizedBox(
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
              errorMessage: errorMessage['description'],
              onChanged: (value) {
                setState(() {
                  _descriptionController.text = value;
                });
              },
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
                    : CustomImageInputEmpty(
                        errorMessage: errorMessage['document'])),
            const SizedBox(
              height: 28,
            ),
            LargeFillButton(
              label: "Lanjut",
              // isDisabled:
              //     _descriptionController.text.isEmpty || evidancePhoto == null,
              onPressed: () {
                validationForm();
                if (errorMessage['description'] == null &&
                    errorMessage['document'] == null) {
                  _attendanceDto = AttendanceDto(
                    description: _descriptionController.text,
                    evidence: File(evidancePhoto!),
                  );
                  widget.onSubmit(_attendanceDto!);
                  context.pop();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
