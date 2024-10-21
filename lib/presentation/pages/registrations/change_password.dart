import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/buttons/button.dart';
import 'package:presience_app/presentation/widgets/form/text_field.dart';
import 'package:presience_app/presentation/widgets/login/heading.dart';

class FirstChangePasswordPage extends StatelessWidget {
  const FirstChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: neutralTheme,
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoginHeading(
                heading: "Ubah Kata Sandi",
                subheading:
                    "Lihat sekitarmu! Awas diintip orang. Nanti kamu jadi gabisa presensi.",
              ),
              SizedBox(
                height: 32,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomPasswordField(
                    label: "Kata Sandi Baru",
                    hint: "Kata Sandi Baru",
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomPasswordField(
                    label: "Ulangi Kata Sandi",
                    hint: "Ulangi Kata Sandi",
                  ),
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
          child: LargeFillButton(
            label: "Masuk",
            onPressed: () {
              context.go('/login/first_change_password/success');
            },
          ),
        ),
      ),
    );
  }
}
