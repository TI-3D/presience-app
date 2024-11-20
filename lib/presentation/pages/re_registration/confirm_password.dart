import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:presience_app/data/dto/requests/change_password_dto.dart';
import 'package:presience_app/presentation/blocs/auth/auth_bloc.dart';
import 'package:presience_app/presentation/blocs/history_attendance/history_attendance_bloc.dart';
import 'package:presience_app/presentation/utils/methods.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/buttons/button.dart';
import 'package:presience_app/presentation/widgets/cards/attendance.dart';
import 'package:presience_app/presentation/widgets/cards/section.dart';
import 'package:presience_app/presentation/widgets/cards/title_section.dart';
import 'package:presience_app/presentation/widgets/containers/content.dart';
import 'package:presience_app/presentation/widgets/containers/detail.dart';
import 'package:presience_app/presentation/widgets/form/text_field.dart';
import 'package:presience_app/presentation/widgets/labels/icon_label.dart';
import 'package:presience_app/presentation/widgets/labels/tag_label.dart';
import 'package:presience_app/presentation/widgets/login/heading.dart';
import 'package:presience_app/presentation/widgets/navigations/app_bar.dart';

import '../../../data/dto/requests/get_history_attendance_dto.dart';
import '../../../domain/entities/schedule_week.dart';
import '../../widgets/cards/history_course_card.dart';
import '../../widgets/skeletons/history_presensi_skeleton.dart';

class ReRegisterFacePage extends StatefulWidget {
  ReRegisterFacePage({
    super.key,
  });

  @override
  State<ReRegisterFacePage> createState() => _ReRegisterFacePageState();
}

class _ReRegisterFacePageState extends State<ReRegisterFacePage> {
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _passwordConfirmationController =
      TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: neutralTheme,
            appBar: CustomAppBar(
              title: 'Detail Presensi',
              onTap: () {
                context.read<HistoryAttendanceBloc>().add(
                      const HistoryAttendanceEvent.getHistoryAttendance(
                        GetHistoryAttendanceDto(
                            attendanceStatus: '', courseId: 0),
                      ),
                    );
                GoRouter.of(context).pop();
              },
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Masukkan Kata Sandi", style: heading3),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Lihat sekitarmu! Awas diintip orang. Nanti wajah kamu jadi gabisa dikenali.",
                          style: regularBodyText.copyWith(
                              color: neutralTheme[500]),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomPasswordField(
                          label: "Kata Sandi",
                          hint: "Kata Sandi",
                          controller: _passwordController,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Container(
              padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
              child: LargeFillButton(
                label: "Konfirmasi",
                onPressed: () {
                  context.go("/re_register_face/camera");
                  // context.read<AuthBloc>().add(
                  //       AuthEvent.changePassword(
                  //         ChangePasswordDto(
                  //           password: _passwordController.text,
                  //           passwordConfirmation:
                  //               _passwordConfirmationController.text,
                  //         ),
                  //       ),
                  //     );
                },
              ),
            )

            // BULDER
            // BlocConsumer<AuthBloc, AuthState>(
            //   listener: (context, state) {
            //     state.maybeWhen(
            //       loginSuccess: (data) {
            //         // return context.go('/login/first_change_password/success');
            //       },
            //       orElse: () {},
            //     );
            //   },

            //   builder: (context, state) {
            //     return state.maybeWhen(
            //       orElse: () {
            //         return
            //         Container(
            //           padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
            //           child: LargeFillButton(
            //             label: "Konfirmasi",
            //             onPressed: () {
            //               context.read<AuthBloc>().add(
            //                     AuthEvent.changePassword(
            //                       ChangePasswordDto(
            //                         password: _passwordController.text,
            //                         passwordConfirmation:
            //                             _passwordConfirmationController.text,
            //                       ),
            //                     ),
            //                   );
            //             },
            //           ),
            //         );
            //       },
            //       loading: () {
            //         return Container(
            //           padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
            //           child: LargeFillButton(
            //             label: "Masuk",
            //             isDisabled: true,
            //             onPressed: () {},
            //           ),
            //         );
            //       },
            //     );
            //   },
            // ),
            ));
  }
}

class ContentofWeekCourse extends StatefulWidget {
  const ContentofWeekCourse({
    super.key,
  });

  @override
  State<ContentofWeekCourse> createState() => _ContentofWeekCourseState();
}

class _ContentofWeekCourseState extends State<ContentofWeekCourse> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryAttendanceBloc, HistoryAttendanceState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const HistoryPresensiSkeleton(),
          success: (data) {
            return ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return HistoryCourseCard(
                  courseName: data[index].schedule!.course!.name!,
                  date: getFormattedDate(data[index].date!),
                  openedTime: data[index].openedAt!,
                  closedTime: data[index].closedAt ?? 'Belum ditutup',
                  courseTime: data[index].schedule!.course!.time!,
                  alpha: data[index].attendance!.alpha!,
                  sakit: data[index].attendance!.sakit!,
                  izin: data[index].attendance!.izin!,
                  courseWeek: data[index].schedule!.week!.name!,
                  onTap: () {},
                  // onTap: () {
                  //   context.push(
                  //     '/presensi/detail',
                  //     extra: data[index],
                  //   );
                  // },
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 8,
              ),
            );
          },
        );
      },
    );
  }
}
