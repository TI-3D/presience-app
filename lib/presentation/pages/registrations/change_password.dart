import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:presience_app/data/dto/requests/change_password_dto.dart';
import 'package:presience_app/presentation/blocs/auth/auth_bloc.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/buttons/button.dart';
import 'package:presience_app/presentation/widgets/form/text_field.dart';
import 'package:presience_app/presentation/widgets/login/heading.dart';

class FirstChangePasswordPage extends StatefulWidget {
  const FirstChangePasswordPage({super.key});

  @override
  State<FirstChangePasswordPage> createState() =>
      _FirstChangePasswordPageState();
}

class _FirstChangePasswordPageState extends State<FirstChangePasswordPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();
  Map<String, String?> errorMessage = {
    "password": null,
    "password_confirmation": null,
  };

  validationForm() {
    setState(() {
      if (_passwordController.text.isEmpty) {
        errorMessage['password'] = "Masukkan Kata Sandi Baru";
      } else if (_passwordController.text.length < 8 &&
          _passwordController.text.isNotEmpty) {
        errorMessage['password'] = "Kata Sandi harus minimal 8 karakter";
      } else {
        errorMessage['password'] = null;
      }

      if (_passwordConfirmationController.text.isEmpty) {
        errorMessage['password_confirmation'] = "Masukkan Ulangi Kata Sandi";
      } else if (_passwordConfirmationController.text.length < 8 &&
          _passwordConfirmationController.text.isNotEmpty) {
        errorMessage['password_confirmation'] =
            "Kata Sandi harus minimal 8 karakter";
      } else if (_passwordController.text !=
          _passwordConfirmationController.text) {
        errorMessage['password_confirmation'] =
            "Masukkan Kata Sandi baru yang sama";
      } else {
        errorMessage['password_confirmation'] = null;
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LoginHeading(
                  heading: "Ubah Kata Sandi",
                  subheading:
                      "Lihat sekitarmu! Awas diintip orang. Nanti kamu jadi gabisa presensi.",
                ),
                const SizedBox(
                  height: 32,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomPasswordField(
                      label: "Kata Sandi Baru",
                      hint: "Kata Sandi Baru",
                      controller: _passwordController,
                      errorMessage: errorMessage['password'],
                      onChanged: (value) {
                        setState(() {
                          _passwordController.text = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomPasswordField(
                      label: "Ulangi Kata Sandi",
                      hint: "Ulangi Kata Sandi",
                      controller: _passwordConfirmationController,
                      errorMessage: errorMessage['password_confirmation'],
                      onChanged: (value) {
                        setState(() {
                          _passwordConfirmationController.text = value;
                        });
                      },
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
                return context.go('/login/first_change_password/success');
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
                    // isDisabled: _passwordController.text.isEmpty ||
                    //     _passwordConfirmationController.text.isEmpty,
                    onPressed: () {
                      validationForm();
                      if (errorMessage["password"] == null &&
                          errorMessage['password_confirmation'] == null) {
                        context.read<AuthBloc>().add(
                              AuthEvent.changePassword(
                                ChangePasswordDto(
                                  password: _passwordController.text,
                                  passwordConfirmation:
                                      _passwordConfirmationController.text,
                                ),
                              ),
                            );
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
