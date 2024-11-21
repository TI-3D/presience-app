import 'dart:io';

import 'package:flutter/material.dart';
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

class FormPengajuanAfterClassPage extends StatefulWidget {
  const FormPengajuanAfterClassPage({super.key});

  @override
  State<FormPengajuanAfterClassPage> createState() =>
      _FormPengajuanAfterClassPageState();
}

class _FormPengajuanAfterClassPageState
    extends State<FormPengajuanAfterClassPage> {
  final TextEditingController _descriptionController = TextEditingController();
  String? evidancePhoto;
  String? pathImage;
  String selectedPermission = "sakit";

  Map<String, String?> errorMessage = {
    'description': null,
    'document': null,
  };

  validateForm() {
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
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future<XFile?> selectImage() async {
      XFile? selectedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      return selectedImage;
    }

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
        appBar: const CustomAppBar(
          title: "Pengubahan Presensi",
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 12, bottom: 16),
          child: Column(
            children: [
              const CustomSection(
                title: "Detail Presensi",
                child: Column(
                  children: [
                    CustomFirstDetailContainer(
                      children: [
                        TitleDetail(title: "Mata Kuliah"),
                        ValueDetail(
                            content: "Administrasi dan Keamanan Jaringan")
                      ],
                    ),
                    CustomMiddleDetailContainer(
                      children: [
                        TitleDetail(title: "Minggu"),
                        ValueDetail(content: "7")
                      ],
                    ),
                    CustomLastDetailContainer(
                      children: [
                        TitleDetail(title: "Tanggal"),
                        ValueDetail(content: "07/10/2024")
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
                        SizedBox(height: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextField(
                              label: 'Deskripsi',
                              hint: 'Deskripsi',
                              isMultiline: true,
                              controller: _descriptionController,
                              errorMessage: errorMessage['description'],
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
                                print(evidancePhoto);
                                print(pathImage);
                              },
                              child: (evidancePhoto != null)
                                  ? CustomImageInputFill(
                                      imageProvider: imageProvider,
                                      pathImage: pathImage)
                                  : CustomImageInputEmpty(
                                      errorMessage: errorMessage['document'],
                                    ))
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
              validateForm();
              if (errorMessage["description"] == null &&
                  errorMessage['document'] == null) {
                context.go('/homepage',
                    extra: {'selectedPageIndex': 1, 'selectedTab': 1});
              }
            },
          ),
        ),
      ),
    );
  }
}
