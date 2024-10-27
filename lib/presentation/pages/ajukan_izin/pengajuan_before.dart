import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
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

class FormPengajuanBeforeClassPage extends StatefulWidget {
  const FormPengajuanBeforeClassPage({super.key});

  @override
  State<FormPengajuanBeforeClassPage> createState() =>
      _FormPengajuanBeforeClassPageState();
}

class _FormPengajuanBeforeClassPageState
    extends State<FormPengajuanBeforeClassPage> {
  String? profilePicture;
  String? pathImage;
  String selectedPermission = "sakit";
  final List<String> _options = [
    'Option 1',
    'Option 2',
    'Option 3',
  ];

  // Keep track of the selected options
  Map<String, bool> _selectedOptions = {};

  @override
  void initState() {
    super.initState();
    // Initialize all options as not selected
    for (String option in _options) {
      _selectedOptions[option] = true;
    }
  }

  void _submitForm() {
    // Print selected options
    final selected = _selectedOptions.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();
    print('Selected options: $selected');
  }

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

    return SafeArea(
      child: Scaffold(
        backgroundColor: neutralTheme,
        appBar: const CustomAppBar(
          title: "Pengajuan",
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
                    Text("31 Oktober 2022 - 31 Oktober 2022",
                        style: mediumBodyText),
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
                    Column(
                      children: [
                        ..._options.map((option) {
                          BorderRadius borderRadius;
                          if (option == _options[0]) {
                            borderRadius =
                                BorderRadius.vertical(top: Radius.circular(8));
                          } else if (option == _options[_options.length - 1]) {
                            borderRadius = BorderRadius.vertical(
                                bottom: Radius.circular(8));
                          } else {
                            borderRadius = BorderRadius.zero;
                          }

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedOptions[option] =
                                    !_selectedOptions[option]!;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: borderRadius,
                                border: Border(
                                  right: BorderSide(
                                      color: neutralTheme[100]!, width: 1),
                                  left: BorderSide(
                                      color: neutralTheme[100]!, width: 1),
                                  top: option == _options[0]
                                      ? BorderSide(
                                          color: neutralTheme[100]!, width: 1)
                                      : BorderSide.none,
                                  bottom: BorderSide(
                                      color: neutralTheme[100]!, width: 1),
                                ),
                                color: _selectedOptions[option]!
                                    ? purpleTheme[100]
                                    : neutralTheme,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    _selectedOptions[option]!
                                        ? TablerIcons.square_check
                                        : TablerIcons.square,
                                    color: _selectedOptions[option]!
                                        ? purpleTheme
                                        : blackTheme,
                                    size: 18,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    option,
                                    style: mediumBodyText.copyWith(
                                      color: _selectedOptions[option]!
                                          ? purpleTheme
                                          : blackTheme,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ],
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
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextField(
                              label: 'Deskripsi',
                              hint: 'Deskripsi',
                              isMultiline: true,
                              errorMessage: "Masukkan Deskripsi",
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
                                  profilePicture = image!.path;
                                  pathImage = path.basename(image.path);
                                });
                                print(profilePicture);
                                print(pathImage);
                              },
                              child: (profilePicture != null)
                                  ? CustomImageInputFill(
                                      imageProvider: imageProvider,
                                      pathImage: pathImage)
                                  : const CustomImageInputEmpty())
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
          child: LargeFillButton(
            label: "Konfirmasi",
            onPressed: () {
              context.push('/camera');
            },
          ),
        ),
      ),
    );
  }
}
