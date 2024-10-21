import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/buttons/button.dart';
import 'package:presience_app/presentation/widgets/form/text_field.dart';
import 'package:presience_app/presentation/widgets/login/heading.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: neutralTheme,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoginHeading(
                  heading: "Masuk ke akunmu",
                  subheading:
                      "Selamat datang kembali, masukkan nim dan kata sandi untuk melanjutkan.",
                ),
                SizedBox(
                  height: 32,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      label: "NIM",
                      hint: "NIM",
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CustomPasswordField(
                      label: "Kata Sandi",
                      hint: "Kata Sandi",
                    ),
                  ],
                )
              ],
            ),
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.only(bottom: 16, right: 16, left: 16),
            child: LargeFillButton(
              label: "Masuk",
              onPressed: () {
                context.go('/login/success');
              },
            ),
          ),
        ),
      ),
    );
  }
}
