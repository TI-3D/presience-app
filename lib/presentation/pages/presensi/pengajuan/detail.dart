import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/buttons/button.dart';
import 'package:presience_app/presentation/widgets/cards/card.dart';
import 'package:presience_app/presentation/widgets/cards/section.dart';
import 'package:presience_app/presentation/widgets/cards/title_section.dart';
import 'package:presience_app/presentation/widgets/containers/content.dart';
import 'package:presience_app/presentation/widgets/containers/detail.dart';
import 'package:presience_app/presentation/widgets/labels/icon_label.dart';
import 'package:presience_app/presentation/widgets/labels/tag_label.dart';
import 'package:presience_app/presentation/widgets/navigations/app_bar.dart';

class DetailPengajuanPage extends StatelessWidget {
  const DetailPengajuanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: neutralTheme,
            appBar: const CustomAppBar(
              title: "Detail Perizinan",
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TitleSection(title: 'Pembelajaran Mesin'),
                                SizedBox(height: 4),
                                Text(
                                  'Amalia Agung Septarina, S.S.M.Tr.TT.',
                                  style: regularBodyText,
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Row(children: [
                                CustomIconLabel(
                                    label: 'LPR 4',
                                    icon: TablerIcons.building,
                                    color: neutralTheme[400]!),
                                SizedBox(
                                  width: 8,
                                ),
                                CustomIconLabel(
                                    label: 'Lantai 7',
                                    icon: TablerIcons.stairs,
                                    color: neutralTheme[400]!),
                                SizedBox(
                                  width: 8,
                                ),
                                CustomIconLabel(
                                    label: '11:40-16:00',
                                    icon: TablerIcons.calendar_time,
                                    color: neutralTheme[400]!),
                                SizedBox(
                                  width: 12,
                                ),
                              ]),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: 0,
                    thickness: 1,
                    color: neutralTheme![100],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  CustomSection(
                      title: 'Detail Perizinan',
                      child: Column(
                        children: [
                          CustomFirstDetailContainer(
                            children: [
                              TitleDetail(title: 'Minggu'),
                              ValueDetail(content: 'Minggu ke-7')
                            ],
                          ),
                          CustomMiddleDetailContainer(
                            children: [
                              TitleDetail(title: 'Tanggal'),
                              ValueDetail(content: '07/10/2024')
                            ],
                          ),
                          CustomLastDetailContainer(
                            children: [
                              TitleDetail(title: 'Status'),
                              CustomTaglabelOrange(label: 'Izin')
                            ],
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 12,
                  ),
                  Divider(
                    height: 0,
                    thickness: 1,
                    color: neutralTheme![100],
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                    child: CustomSection(
                      title: 'Surat Izin',
                      child: CustomCard(
                        onTap: () {},
                        // child: Container(
                        //   decoration: BoxDecoration(
                        //     image: DecorationImage(
                        //       image: AssetImage(
                        //           'assets/images/dokumenSurat.png'), // Path ke gambar lokal
                        //       fit: BoxFit
                        //           .cover, // Mengatur ukuran gambar agar sesuai dengan container
                        //     ),
                        //   ),
                        // ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Container(
                                constraints: BoxConstraints(maxHeight: 200),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: neutralTheme[100]!, // Warna border
                                    width: 1, // Ketebalan border
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/dokumenSurat.png'), // Path ke gambar lokal
                                    fit: BoxFit
                                        .cover, // Mengatur ukuran gambar agar sesuai dengan container
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      4), // Membuat border melengkung
                                ),

                                // child: ClipRRect(
                                //   borderRadius: BorderRadius.circular(4),
                                //   child: Image.asset(
                                //       'assets/images/dokumenSurat.png',
                                //       fit: BoxFit.cover),
                                // ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              SmallFillButton(
                                  label: 'Unduh Gambar', onPressed: () {})
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
