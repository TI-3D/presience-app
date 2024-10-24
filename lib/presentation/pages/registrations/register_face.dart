import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/buttons/button.dart';
import 'package:presience_app/presentation/widgets/login/heading.dart';

class RegisterFacePage extends StatelessWidget {
  const RegisterFacePage({super.key});

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
                heading: "Presensi Wajah",
                subheading:
                    "Sebelum lanjut, yuk daftarin wajahmu terlebih dahulu biar bisa presensi.",
              ),
              const SizedBox(
                height: 32,
              ),
              Image.asset(
                  "assets/streamline/Face-Id--Streamline-Barcelona.png"),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
          child: LargeFillButton(
            label: "Daftar",
            onPressed: () {
              GoRouter.of(context).push('/camera');
            },
          ),
        ),
      ),
    );
  }
}
