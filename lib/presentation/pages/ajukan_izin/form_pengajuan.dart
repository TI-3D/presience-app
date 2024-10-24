import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:presience_app/presentation/pages/home/homepage.dart';
import 'package:presience_app/presentation/utils/methods.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/buttons/button.dart';
import 'package:presience_app/presentation/widgets/cards/section.dart';
import 'package:presience_app/presentation/widgets/cards/title_section.dart';
import 'package:presience_app/presentation/widgets/containers/content.dart';
import 'package:presience_app/presentation/widgets/containers/detail.dart';
import 'package:presience_app/presentation/widgets/form/label.dart';
import 'package:presience_app/presentation/widgets/form/radio_desc.dart';
import 'package:presience_app/presentation/widgets/form/text_field.dart';
import 'package:presience_app/presentation/widgets/navigations/app_bar.dart';

class FormPengajuanPage extends StatefulWidget {
  const FormPengajuanPage({super.key});

  @override
  State<FormPengajuanPage> createState() => _FormPengajuanPageState();
}

class _FormPengajuanPageState extends State<FormPengajuanPage> {
  String? profilePicture;
  String? pathImage;
  String selectedPermission = "sakit";
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                    const SizedBox(height: 30),
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
                                  ? Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(16),
                                          width: double.infinity,
                                          height:
                                              220, // Tambahkan tinggi container agar cukup ruang untuk teks di bawah
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                              color: neutralTheme[200]!,
                                              style: BorderStyle.solid,
                                              width: 1.0,
                                            ),
                                            color: neutralTheme[100],
                                          ),
                                          // Column untuk menempatkan gambar dan teks secara vertikal
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // Container untuk gambar
                                              Container(
                                                height:
                                                    150, // Batasi tinggi gambar
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 16),
                                              Align(
                                                alignment: Alignment.center,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    // Path Image
                                                    Text(
                                                      pathImage!,
                                                      style: regularBodyTextS
                                                          .copyWith(
                                                        color:
                                                            neutralTheme[300],
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    const SizedBox(width: 8),
                                                    Text(
                                                      'Ubah',
                                                      style: mediumBodyTextS
                                                          .copyWith(
                                                        color:
                                                            neutralTheme[300],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  : DottedBorder(
                                      borderType: BorderType
                                          .RRect, // Membuat sudut membulat
                                      radius: const Radius.circular(
                                          8), // Radius sudut sesuai kebutuhan
                                      dashPattern: const [
                                        8,
                                        8
                                      ], // Mengatur pola garis putus-putus
                                      color: neutralTheme[200]!, // Warna border
                                      strokeWidth: 1, // Ketebalan garis border
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: 188,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              TablerIcons.photo_up,
                                              size: 48,
                                              color: purpleTheme[950],
                                            ),
                                            Text(
                                              'Unggah Gambar',
                                              style: mediumBodyText.copyWith(
                                                color: purpleTheme[950],
                                              ),
                                            ),
                                            Text(
                                              'Ukuran gambar maksimal 2MB',
                                              style: mediumBodyTextS.copyWith(
                                                color: neutralTheme[300],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
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
              // context.go('/login/success');
            },
          ),
        ),
      ),
    );
  }
}
