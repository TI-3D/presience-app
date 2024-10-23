import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/detail.dart';
import 'package:presience_app/presentation/widgets/form/text_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:presience_app/presentation/widgets/buttons/button.dart';
import 'package:dotted_border/dotted_border.dart';

class FormPengajuanPage extends StatefulWidget {
  const FormPengajuanPage({super.key});

  @override
  State<FormPengajuanPage> createState() => _FormPengajuanPageState();
}

class _FormPengajuanPageState extends State<FormPengajuanPage> {
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

    return SafeArea(
      child: Scaffold(
        backgroundColor: neutralTheme,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: neutralTheme[200]!,
                  width: 1.0, // Ketebalan garis
                ),
              ),
            ),
            child: AppBar(
              scrolledUnderElevation: 0,
              backgroundColor: neutralTheme,
              toolbarHeight: 48,
              leading: Container(
                margin: EdgeInsets.only(left: 16),
                child: Icon(
                  TablerIcons.arrow_left,
                  size: 24,
                ),
              ),
              title: Text(
                'Pengajuan',
                style: mediumBodyTextL,
              ),
              centerTitle: true,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Detail Presensi',
                      style: mediumBodyTextL,
                    ),
                    SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: neutralTheme[100]!,
                              width: 1.0,
                            ),
                            left: BorderSide(
                              color: neutralTheme[100]!,
                              width: 1.0,
                            ),
                            right: BorderSide(
                              color: neutralTheme[100]!,
                              width: 1.0,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          width: double.infinity,
                          child: Column(
                            children: [
                              CustomDetailContainer(
                                  title: 'Mata Kuliah',
                                  content: 'Pemrograman Mobile'),
                              CustomDetailContainer(
                                  title: 'Minggu', content: 'Minggu ke-7'),
                              CustomDetailContainer(
                                  title: 'Tanggal', content: '07/10/2024'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                color: neutralTheme[200],
                height: 1,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jenis Izin',
                          style: mediumBodyText.copyWith(),
                        ),
                        SizedBox(height: 8),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: purpleTheme[200]!,
                                    width: 1.0,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                        ),
                                        border: Border(
                                          bottom: BorderSide(
                                            color: purpleTheme[200]!,
                                            width: 1.0,
                                          ),
                                        ),
                                        color: purpleTheme[100]!,
                                      ),
                                      padding: EdgeInsets.all(8),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Sakit",
                                                  style:
                                                      mediumBodyText.copyWith(
                                                          color: purpleTheme[
                                                              950])),
                                              SizedBox(width: 8),
                                              Icon(
                                                TablerIcons.circle_check,
                                                size: 20,
                                                color: purpleTheme[950],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),

                                      // Text("Sakit", style: mediumBodyText),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      child: Text(
                                        'Kalau sakit, kamu butuh surat dokter',
                                        style: mediumBodyTextS.copyWith(
                                            color: neutralTheme[500]!),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                              SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                  child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: neutralTheme[200]!,
                                    width: 1.0,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                        ),
                                        border: Border(
                                          bottom: BorderSide(
                                            color: neutralTheme[200]!,
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                      padding: EdgeInsets.all(8),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Izin",
                                                  style:
                                                      mediumBodyText.copyWith(
                                                          color: blackTheme)),
                                              SizedBox(width: 8),
                                              Icon(
                                                TablerIcons.circle,
                                                size: 20,
                                                color: blackTheme,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),

                                      // Text("Sakit", style: mediumBodyText),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      child: Text(
                                        'Kamu bisa gunakan surat apapun',
                                        style: mediumBodyTextS.copyWith(
                                            color: neutralTheme[500]!),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                            ],
                          ),
                        ),
                      ],
                    )),
                    SizedBox(height: 28),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextField(
                                  label: 'Deskripsi',
                                  hint: 'Deskripsi',
                                  isMultiline: true,
                                  errorMessage: "Masukkan Deskripsi",
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dokumen',
                            style: mediumBodyText,
                          ),
                          SizedBox(height: 8),
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
                                          padding: EdgeInsets.all(16),
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
                                              SizedBox(height: 16),
                                              Align(
                                                alignment: Alignment.center,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    // Path Image
                                                    Container(
                                                      child: Text(
                                                        pathImage!,
                                                        style: regularBodyTextS
                                                            .copyWith(
                                                          color:
                                                              neutralTheme[300],
                                                        ),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    SizedBox(width: 8),
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

                                              // Padding(
                                              //   padding: EdgeInsets.fromLTRB(
                                              //       89.5, 0, 89.5, 0),

                                              // ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  : DottedBorder(
                                      borderType: BorderType
                                          .RRect, // Membuat sudut membulat
                                      radius: Radius.circular(
                                          8), // Radius sudut sesuai kebutuhan
                                      dashPattern: [
                                        8,
                                        8
                                      ], // Mengatur pola garis putus-putus
                                      color: neutralTheme[200]!, // Warna border
                                      strokeWidth: 1, // Ketebalan garis border
                                      child: Container(
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
          padding: EdgeInsets.only(bottom: 16, right: 16, left: 16),
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
