import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/buttons/button.dart';
import 'package:presience_app/presentation/widgets/login/heading.dart';

class FirstChangePasswordSuccessPage extends StatelessWidget {
  const FirstChangePasswordSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: neutralTheme,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LoginHeading(
                heading: "Kata Sandi Diperbarui!",
                subheading:
                    "Kata sandimu sudah diperbarui nih. Jangan sampai kelupaan ya!",
              ),
              const SizedBox(
                height: 32,
              ),
              Image.asset(
                  "assets/streamline/Reset-Password-2--Streamline-Barcelona.png"),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
          child: LargeFillButton(
            label: "Lanjut",
            onPressed: () {
              context.go('/login/register_face');
            },
          ),
        ),
      ),
    );
  }
}
