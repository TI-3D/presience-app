import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:presience_app/presentation/utils/methods.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/cameras/camera_buttons.dart';
import 'package:presience_app/presentation/widgets/cameras/camera_full.dart';
import 'package:presience_app/presentation/widgets/modal/button.dart';
import 'package:presience_app/presentation/widgets/modal/dialog.dart';
import 'package:presience_app/presentation/widgets/modal/loading.dart';

class CameraRegistrationPage extends StatefulWidget {
  const CameraRegistrationPage({super.key});

  @override
  State<CameraRegistrationPage> createState() => _CameraRegistrationPageState();
}

class _CameraRegistrationPageState extends State<CameraRegistrationPage> {
  late CameraController controller;
  int _currentCameraIndex = 0;

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
        builder: (_, snapshot) =>
            snapshot.connectionState == ConnectionState.done
                ? Stack(children: [
                    CameraFullRatio(controller: controller),
                    CameraButtons(
                      onTapCamera: () {
                        // context.go('/homepage');
                        showCustomDialog(
                          context,
                          isLoading: true,
                          getResponse: () async {
                            await Future.delayed(const Duration(seconds: 5));
                            return true; // change to false to simulate failure
                          },
                          onResponse: (response) {
                            if (response) {
                              context.pop();
                              context.go('/homepage');
                            } else {
                              context.pop();
                              showCustomDialog(context,
                                  child: CustomDialog(
                                    child: DialogContentButton(
                                        title: "Proses Gagal",
                                        subtitle:
                                            "Kami kesulitan mengenali wajahmu. Coba lagi dengan pencahayaan yang lebih terang.",
                                        label: "Ulangi",
                                        onPressed: () {
                                          context.pop();
                                        }),
                                  ));
                            }
                          },
                          child: const CustomDialog(
                            child: DialogContentLoading(
                                title: "Tunggu sebentar",
                                subtitle: "Wajah kamu sedang di proses"),
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
                      },
                    ),
                  ])
                : Container(
                    color: blackTheme,
                  ),
      ),
    ));
  }
}
