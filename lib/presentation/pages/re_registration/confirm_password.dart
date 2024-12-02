import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:presience_app/presentation/blocs/face_recognition/face_recognition_bloc.dart';
import 'package:presience_app/presentation/blocs/history_attendance/history_attendance_bloc.dart';
import 'package:presience_app/presentation/utils/methods.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/buttons/button.dart';
import 'package:presience_app/presentation/widgets/form/text_field.dart';
import 'package:presience_app/presentation/widgets/navigations/app_bar.dart';

import '../../widgets/cards/history_course_card.dart';
import '../../widgets/modal/button.dart';
import '../../widgets/modal/dialog.dart';
import '../../widgets/skeletons/history_presensi_skeleton.dart';

class ReRegisterFacePage extends StatefulWidget {
  const ReRegisterFacePage({
    super.key,
  });

  @override
  State<ReRegisterFacePage> createState() => _ReRegisterFacePageState();
}

class _ReRegisterFacePageState extends State<ReRegisterFacePage> {
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _passwordConfirmationController =
      TextEditingController();

  Map<String, String?> errorMessage = {
    "password": null,
  };

  void validateForm() {
    setState(() {
      // Validasi password
      if (_passwordController.text.isEmpty) {
        errorMessage['password'] = "Masukkan Kata Sandi";
      } else {
        errorMessage['password'] = null;
      }
    });
  }

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
                      style: regularBodyText.copyWith(color: neutralTheme[500]),
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
                      errorMessage: errorMessage['password'],
                      onChanged: (value) {
                        setState(() {
                          _passwordController.text = value;
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar:
            BlocConsumer<FaceRecognitionBloc, FaceRecognitionState>(
          listener: (context, state) {
            state.maybeWhen(
              success: (message) {
                return context.go("/re_register_face/camera");
              },
              failure: (message) {
                showCustomDialog(
                  context,
                  child: CustomDialog(
                    child: DialogContentButton(
                      title: "Verifikasi Password Gagal",
                      subtitle: "Password yang kamu masukkan salah.",
                      label: "Ulangi",
                      onPressed: () {
                        context.pop();
                      },
                    ),
                  ),
                );
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return Container(
                  padding:
                      const EdgeInsets.only(bottom: 16, right: 16, left: 16),
                  child: LargeFillButton(
                    label: "Konfirmasi",
                    onPressed: () {
                      validateForm();
                      if (errorMessage["password"] == null) {
                        context.read<FaceRecognitionBloc>().add(
                            FaceRecognitionEvent.validatePassword(
                                _passwordController.text));
                      }
                    },
                  ),
                );
              },
              loading: () {
                return Container(
                  padding:
                      const EdgeInsets.only(bottom: 16, right: 16, left: 16),
                  child: LargeFillButton(
                    label: "Konfirmasi",
                    isDisabled: true,
                    onPressed: () {},
                  ),
                );
              },
            );
          },
        ),
      ),
    );
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
