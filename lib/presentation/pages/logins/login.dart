import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:presience_app/presentation/blocs/attendance/attendance_bloc.dart';
import 'package:presience_app/presentation/blocs/attendance_week/attendance_week_bloc.dart';
import 'package:presience_app/presentation/blocs/auth/auth_bloc.dart';
import 'package:presience_app/presentation/blocs/course/course_bloc.dart';
import 'package:presience_app/presentation/blocs/permit/permit_bloc.dart';
import 'package:presience_app/presentation/blocs/schedule/schedule_bloc.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/buttons/button.dart';
import 'package:presience_app/presentation/widgets/form/text_field.dart';
import 'package:presience_app/presentation/widgets/login/heading.dart';

import '../../../data/dto/requests/login_dto.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nimController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: neutralTheme,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LoginHeading(
                  heading: "Masuk ke akunmu",
                  subheading:
                      "Selamat datang kembali, masukkan nim dan kata sandi untuk melanjutkan.",
                ),
                const SizedBox(
                  height: 32,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      label: "NIM",
                      hint: "NIM",
                      controller: _nimController,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
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
        bottomNavigationBar: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            state.maybeWhen(
              loginSuccess: (data) {
                context
                    .read<AttendanceBloc>()
                    .add(const AttendanceEvent.getAttendanceInformation());
                context
                    .read<ScheduleBloc>()
                    .add(const ScheduleEvent.getSchedulesToday());
                context
                    .read<AttendanceWeekBloc>()
                    .add(const AttendanceWeekEvent.getHistoryAttendanceWeek());
                context
                    .read<PermitBloc>()
                    .add(const PermitEvent.getHistoryPermit());
                context.read<CourseBloc>().add(const CourseEvent.getCourses());

                if (data.user!.isVerified!) {
                  return context.go('/homepage');
                }
                return context.go('/login/success');
              },
              failure: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                    backgroundColor: Colors.red,
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
                    label: "Masuk",
                    onPressed: () {
                      context.read<AuthBloc>().add(
                            AuthEvent.login(
                              LoginDto(
                                nim: _nimController.text,
                                password: _passwordController.text,
                              ),
                            ),
                          );
                    },
                  ),
                );
              },
              loading: () {
                return Container(
                  padding:
                      const EdgeInsets.only(bottom: 16, right: 16, left: 16),
                  child: LargeFillButton(
                    label: "Masuk",
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
