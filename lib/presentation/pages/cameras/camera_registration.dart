import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:presience_app/presentation/blocs/face_recognition/face_recognition_bloc.dart';
import 'package:presience_app/presentation/utils/methods.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/cameras/camera_buttons.dart';
import 'package:presience_app/presentation/widgets/cameras/camera_frame.dart';
import 'package:presience_app/presentation/widgets/cameras/camera_full.dart';

import '../../widgets/modal/button.dart';
import '../../widgets/modal/dialog.dart';
import '../../widgets/modal/loading.dart';

class CameraRegistrationPage extends StatefulWidget {
  const CameraRegistrationPage({super.key});

  @override
  State<CameraRegistrationPage> createState() => _CameraRegistrationPageState();
}

class _CameraRegistrationPageState extends State<CameraRegistrationPage> {
  late CameraController controller;
  int _currentCameraIndex = 0;
  bool _showPicture = false;
  File? fileImage;

  Future<void> initializeController() async {
    List<CameraDescription> cameras = await availableCameras();
    controller = CameraController(
        cameras[_currentCameraIndex], ResolutionPreset.ultraHigh);
    await controller.initialize();
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
        body: FutureBuilder(
          future: initializeController(),
          builder: (_, snapshot) => snapshot.connectionState ==
                  ConnectionState.done
              ? Stack(children: [
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
                  BlocConsumer<FaceRecognitionBloc, FaceRecognitionState>(
                    listener: (context, state) {
                      state.maybeWhen(
                        success: (message) {
                          return context.go('/homepage');
                        },
                        failure: (message) {
                          showCustomDialog(
                            context,
                            isLoading: true,
                            child: CustomDialog(
                              child: DialogContentButton(
                                title: "Proses Gagal",
                                subtitle:
                                    "Kami kesulitan mengenali wajahmu. Coba lagi dengan pencahayaan yang lebih terang.",
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
                        loading: () {
                          return const CustomDialog(
                            child: DialogContentLoading(
                              title: "Tunggu sebentar",
                              subtitle: "Kami sedang mengenali wajah kamu",
                            ),
                          );
                        },
                        orElse: () {
                          return CameraButtons(
                            onTapCamera: () async {
                              File? picture = await takePicture();
                              if (picture != null) {
                                setState(() {
                                  _showPicture = true;
                                });
                                context.read<FaceRecognitionBloc>().add(
                                    FaceRecognitionEvent.storeFace(picture));
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
                            },
                          );
                        },
                      );
                    },
                  ),
                ])
              : Container(
                  color: blackTheme,
                ),
        ),
      ),
    );
  }
}
