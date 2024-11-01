// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:presience_app/data/datasources/remote_datasources/permit_remote_datasource.dart';
import 'package:presience_app/domain/entities/permit_detail.dart';
import 'package:presience_app/presentation/utils/methods.dart';
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

import '../../../widgets/modal/button.dart';
import '../../../widgets/modal/dialog.dart';

class DetailPengajuanPage extends StatelessWidget {
  final PermitDetail? permitDetail;

  const DetailPengajuanPage({
    super.key,
    required this.permitDetail,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: neutralTheme,
        appBar: CustomAppBar(
          title: "Detail Perizinan",
          onTap: () {
            GoRouter.of(context).pop();
          },
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitleSection(
                              title: permitDetail!
                                  .scheduleWeek!.schedule!.course!.name!,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              permitDetail!
                                  .scheduleWeek!.schedule!.lecturer!.name!,
                              style: regularBodyText,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Row(
                            children: [
                              CustomIconLabel(
                                label: permitDetail!
                                    .scheduleWeek!.schedule!.room!.name!,
                                icon: TablerIcons.building,
                                color: neutralTheme[400]!,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              CustomIconLabel(
                                label:
                                    "Lantai ${permitDetail!.scheduleWeek!.schedule!.week!.name!}",
                                icon: TablerIcons.stairs,
                                color: neutralTheme[400]!,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              CustomIconLabel(
                                label:
                                    "${permitDetail!.scheduleWeek!.schedule!.startTime!}-${permitDetail!.scheduleWeek!.schedule!.endTime!}",
                                icon: TablerIcons.calendar_time,
                                color: neutralTheme[400]!,
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                height: 0,
                thickness: 1,
                color: neutralTheme[100],
              ),
              const SizedBox(
                height: 12,
              ),
              CustomSection(
                title: 'Detail Perizinan',
                child: Column(
                  children: [
                    CustomFirstDetailContainer(
                      children: [
                        const TitleDetail(title: 'Minggu'),
                        ValueDetail(
                          content:
                              'Minggu ke-${permitDetail!.scheduleWeek!.schedule!.week!.name!}',
                        )
                      ],
                    ),
                    CustomMiddleDetailContainer(
                      children: [
                        const TitleDetail(title: 'Tanggal'),
                        ValueDetail(
                          content: getFormattedDate(
                            permitDetail!.scheduleWeek!.date!,
                          ),
                        )
                      ],
                    ),
                    CustomLastDetailContainer(
                      children: [
                        const TitleDetail(title: 'Status'),
                        CustomTaglabelOrange(
                          label: (permitDetail!.permit!.typePermit! == 'izin')
                              ? 'Izin'
                              : 'Sakit',
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Divider(
                height: 0,
                thickness: 1,
                color: neutralTheme[100],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                child: CustomSection(
                  title: 'Surat Izin',
                  child: CustomCard(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Container(
                            constraints: const BoxConstraints(maxHeight: 200),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: neutralTheme[100]!,
                                width: 1,
                              ),
                              image: DecorationImage(
                                image: NetworkImage(
                                    permitDetail!.permit!.evidence!),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          SmallFillButton(
                            label: 'Unduh Gambar',
                            onPressed: () async {
                              final response =
                                  PermitRemoteDatasource().downloadImage(
                                permitDetail!.permit!.evidence!,
                              );

                              if (await response) {
                                showCustomDialog(
                                  context,
                                  child: CustomDialog(
                                    child: DialogContentButton(
                                      title: "Unduhan Gambar Berhasil",
                                      subtitle:
                                          "Gambar telah diunduh dan disimpan di lokasi penyimpanan.",
                                      label: "Oke",
                                      onPressed: () {
                                        context.pop();
                                      },
                                    ),
                                  ),
                                );
                              } else {
                                showCustomDialog(
                                  context,
                                  child: CustomDialog(
                                    child: DialogContentButton(
                                      title: "Unduh Gambar Gagal",
                                      subtitle: "Tidak dapat mengunduh gambar.",
                                      label: "Oke",
                                      onPressed: () {
                                        context.pop();
                                      },
                                    ),
                                  ),
                                );
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
