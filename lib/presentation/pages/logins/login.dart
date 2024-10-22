import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:presience_app/presentation/blocs/auth/auth_bloc.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/buttons/button.dart';
import 'package:presience_app/presentation/widgets/form/text_field.dart';
import 'package:presience_app/presentation/widgets/login/heading.dart';

import '../../../data/dto/requests/login_dto.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController nimController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                      controller: nimController,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomPasswordField(
                      label: "Kata Sandi",
                      hint: "Kata Sandi",
                      controller: passwordController,
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
                if (data.user!.isVerified! == true) {
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
                                nim: nimController.text,
                                password: passwordController.text,
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
