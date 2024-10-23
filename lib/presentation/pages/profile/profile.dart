import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/cards/card.dart';
import 'package:presience_app/presentation/widgets/cards/section.dart';
import 'package:presience_app/presentation/widgets/labels/icon_label.dart';
import 'package:presience_app/presentation/widgets/labels/text_label.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.only(top: 32, bottom: 12),
          color: neutralTheme[50],
          child: CustomSection(
              title: "Profil Pengguna",
              child: CustomCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                                color: neutralTheme[100]!, width: 1)),
                        child: Image.asset(
                            'assets/default/Men-Avatar-Default.png')),
                    SizedBox(
                      height: 8,
                    ),
                    Text("Rahmat Budi Sudarso",
                        style: heading3.copyWith(
                            fontWeight: fontWeight['SemiBold'])),
                    Text("2241720001",
                        style:
                            mediumBodyText.copyWith(color: neutralTheme[500])),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: neutralTheme[50]),
                        width: double.infinity,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: CustomTextLabel(
                                        label: "Jenis Kelamin",
                                        value: "Laki-laki")),
                                Expanded(
                                    child: CustomTextLabel(
                                        label: "Program Studi",
                                        value: "Teknik Informatika")),
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: CustomTextLabel(
                                        label: "Kelas", value: "3D")),
                                Expanded(
                                    child: CustomTextLabel(
                                        label: "Semester", value: "5")),
                              ],
                            ),
                          ],
                        ))
                  ],
                ),
              )),
        ),
        Divider(
          height: 1,
          thickness: 1,
          color: neutralTheme[100],
        ),
        SizedBox(
          height: 12,
        ),
        CustomSection(
            title: "Pengaturan",
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: neutralTheme,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8)),
                    border: Border(
                        left: BorderSide(color: neutralTheme[100]!, width: 1),
                        right: BorderSide(color: neutralTheme[100]!, width: 1),
                        top: BorderSide(color: neutralTheme[100]!, width: 1),
                        bottom:
                            BorderSide(color: neutralTheme[100]!, width: 1))),
                constraints: BoxConstraints(minHeight: 52),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomLargeIconLabel(
                        label: "Keluar",
                        icon: TablerIcons.logout,
                        color: redTheme),
                    Icon(TablerIcons.chevron_right,
                        size: 20, color: neutralTheme[300]),
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
