import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:presience_app/presentation/router/routes.dart';
import 'package:presience_app/presentation/utils/theme.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
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
        builder: (_, snapshot) => snapshot.connectionState ==
                ConnectionState.done
            ? Stack(children: [
                Expanded(
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(_currentCameraIndex == 1
                        ? 3.14
                        : 0), // Flip horizontal untuk kamera depan
                    child: AspectRatio(
                      aspectRatio: 1 / controller.value.aspectRatio,
                      child: CameraPreview(controller),
                    ),
                  ),
                ),
                Column(children: [
                  Expanded(child: Container()),
                  Container(
                    width: double.infinity,
                    height: 152,
                    child: Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    GoRouter.of(context).pop();
                                  },
                                  child: Container(
                                    width: 56,
                                    height: 56,
                                    decoration: BoxDecoration(
                                        color: neutralTheme,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Center(
                                      child: Icon(
                                        TablerIcons.arrow_left,
                                        size: 32,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 84,
                                  height: 84,
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 4, color: neutralTheme),
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8),
                                        child: GestureDetector(
                                          onTap: () {
                                            context.go('/homepage');
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: neutralTheme,
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _currentCameraIndex =
                                          _currentCameraIndex == 0 ? 1 : 0;
                                    });
                                  },
                                  child: Container(
                                    width: 56,
                                    height: 56,
                                    decoration: BoxDecoration(
                                        color: neutralTheme,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Center(
                                      child: Icon(
                                        TablerIcons.camera_rotate,
                                        size: 32,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ])
              ])
            : Container(
                color: blackTheme,
              ),
      ),
    ));
  }
}
