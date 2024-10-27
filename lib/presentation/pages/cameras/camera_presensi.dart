import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:presience_app/presentation/pages/cameras/camera_registration.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/buttons/button.dart';
import 'package:presience_app/presentation/widgets/cameras/camera_buttons.dart';
import 'package:presience_app/presentation/widgets/cameras/camera_full.dart';
import 'package:presience_app/presentation/widgets/cards/title_section.dart';
import 'package:presience_app/presentation/widgets/containers/button_sheet.dart';
import 'package:presience_app/presentation/widgets/form/label.dart';
import 'package:presience_app/presentation/widgets/form/text_field.dart';
import 'package:path/path.dart' as path;
import 'package:presience_app/presentation/widgets/form/input_image.dart';

class CameraPresensiPage extends StatefulWidget {
  const CameraPresensiPage({super.key});

  @override
  State<CameraPresensiPage> createState() => _CameraPresensiPageState();
}

class _CameraPresensiPageState extends State<CameraPresensiPage> {
  late CameraController controller;
  int _currentCameraIndex = 0;
  bool isLate = true;

  Future<void> initializeController() async {
    List<CameraDescription> cameras = await availableCameras();
    controller = CameraController(
        cameras[_currentCameraIndex], ResolutionPreset.ultraHigh);
    await controller.initialize();
  }

  @override
  void initState() {
    super.initState();
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => FormLate(),
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
                  CameraButtons(
                    onTapCamera: () {
                      context.go('/homepage');
                    },
                    onTapRotateCamera: () {
                      setState(() {
                        _currentCameraIndex = _currentCameraIndex == 0 ? 1 : 0;
                      });
                    },
                    onTapBack: () {
                      GoRouter.of(context).pop();
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
  const FormLate({
    super.key,
  });

  @override
  State<FormLate> createState() => _FormLateState();
}

class _FormLateState extends State<FormLate> {
  final TextEditingController _descriptionController = TextEditingController();
  String? profilePicture;
  String? pathImage;

  @override
  Widget build(BuildContext context) {
    Future<XFile?> selectImage() async {
      XFile? selectedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      return selectedImage;
    }

    ImageProvider imageProvider;
    if (profilePicture == null || profilePicture == '') {
      imageProvider = const AssetImage('assets/images/user-profile.png');
    } else if (profilePicture!.startsWith('http') ||
        profilePicture!.startsWith('https')) {
      imageProvider = NetworkImage(profilePicture!);
    } else {
      imageProvider = FileImage(File(profilePicture!));
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
                TitleSection(title: "Keterlambatan"),
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
            SizedBox(
              height: 8,
            ),
            CustomTextField(
              label: "Deskripsi",
              hint: "Deskripsi",
              isMultiline: true,
            ),
            SizedBox(
              height: 8,
            ),
            FieldLabel(label: "Dokumen"),
            SizedBox(
              height: 8,
            ),
            InkWell(
                onTap: () async {
                  final image = await selectImage();
                  setState(() {
                    profilePicture = image!.path;
                    pathImage = path.basename(image.path);
                  });
                  print(profilePicture);
                  print(pathImage);
                },
                child: (profilePicture != null)
                    ? CustomImageInputFill(
                        imageProvider: imageProvider, pathImage: pathImage)
                    : CustomImageInputEmpty()),
            SizedBox(
              height: 28,
            ),
            LargeFillButton(
                label: "Lanjut",
                onPressed: () {
                  /*  send form
                  here
                  */
                  context.pop();
                })
          ],
        ),
      ),
    );
  }
}
