import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:presience_app/presentation/blocs/auth/auth_bloc.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/cards/card.dart';
import 'package:presience_app/presentation/widgets/cards/section.dart';
import 'package:presience_app/presentation/widgets/labels/icon_label.dart';
import 'package:presience_app/presentation/widgets/labels/text_label.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return state.maybeWhen(
              loginSuccess: (data) {
                return Container(
                  padding: const EdgeInsets.only(top: 32, bottom: 12),
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
                                  color: neutralTheme[100]!, width: 1),
                            ),
                            child: (data.user!.avatar != null)
                                ? Image.network(
                                    data.user!.avatar!,
                                    fit: BoxFit.cover,
                                  )
                                : (data.user!.gender == 'male')
                                    ? Image.asset(
                                        'assets/default/Men-Avatar-Default.png',
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        'assets/default/Girl-Avatar-Default.png',
                                        fit: BoxFit.cover,
                                      ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            data.user!.name!,
                            style: heading3.copyWith(
                              fontWeight: fontWeight['SemiBold'],
                            ),
                          ),
                          Text(
                            data.user!.nim!,
                            style: mediumBodyText.copyWith(
                              color: neutralTheme[500],
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                                color: neutralTheme[50]),
                            width: double.infinity,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: CustomTextLabel(
                                        label: "Jenis Kelamin",
                                        value: (data.user!.gender! == 'male')
                                            ? 'Laki-laki'
                                            : 'Perempuan',
                                      ),
                                    ),
                                    Expanded(
                                      child: CustomTextLabel(
                                        label: "Program Studi",
                                        value: data.user!.major!,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: CustomTextLabel(
                                        label: "Kelas",
                                        value: data.user!.group!.name!,
                                      ),
                                    ),
                                    Expanded(
                                      child: CustomTextLabel(
                                        label: "Semester",
                                        value: data.user!.semester.toString(),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              orElse: () {
                return Container(
                  padding: const EdgeInsets.only(top: 32, bottom: 12),
                  color: neutralTheme[50],
                  child: CustomSection(
                    title: "Profil Pengguna",
                    child: Skeletonizer(
                      containersColor: neutralTheme,
                      enabled: true, // Flag to toggle skeleton
                      enableSwitchAnimation: true, //
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
                                    color: neutralTheme[100]!, width: 1),
                              ),
                              child: const Bone.circle(),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              BoneMock.name,
                              style: heading3.copyWith(
                                fontWeight: fontWeight['SemiBold'],
                              ),
                            ),
                            Text(
                              BoneMock.phone,
                              style: mediumBodyText.copyWith(
                                color: neutralTheme[500],
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                  color: neutralTheme[50]),
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomTextLabel(
                                            label: BoneMock.title,
                                            value: BoneMock.title),
                                      ),
                                      Expanded(
                                        child: CustomTextLabel(
                                            label: BoneMock.title,
                                            value: BoneMock.title),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomTextLabel(
                                            label: BoneMock.title,
                                            value: BoneMock.title),
                                      ),
                                      Expanded(
                                        child: CustomTextLabel(
                                            label: BoneMock.title,
                                            value: BoneMock.title),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
        Divider(
          height: 1,
          thickness: 1,
          color: neutralTheme[100],
        ),
        const SizedBox(
          height: 12,
        ),
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.maybeWhen(
              initial: () {
                context.go('/');
              },
              orElse: () {},
            );
          },
          child: CustomSection(
            title: "Pengaturan",
            child: GestureDetector(
              onTap: () {
                context.read<AuthBloc>().add(const AuthEvent.logout());
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: neutralTheme,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  border: Border(
                    left: BorderSide(color: neutralTheme[100]!, width: 1),
                    right: BorderSide(color: neutralTheme[100]!, width: 1),
                    top: BorderSide(color: neutralTheme[100]!, width: 1),
                    bottom: BorderSide(color: neutralTheme[100]!, width: 1),
                  ),
                ),
                constraints: const BoxConstraints(minHeight: 52),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomLargeIconLabel(
                        label: "Keluar",
                        icon: TablerIcons.logout,
                        color: redTheme),
                    Icon(
                      TablerIcons.chevron_right,
                      size: 20,
                      color: neutralTheme[300],
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
