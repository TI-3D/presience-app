import 'package:flutter/material.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';

class LoginHeading extends StatelessWidget {
  final String heading;
  final String subheading;
  const LoginHeading(
      {super.key, required this.heading, required this.subheading});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          "assets/icons/presience_logo_vertical.png",
          height: 24,
        ),
        const SizedBox(height: 28),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(heading, style: heading2),
            const SizedBox(
              height: 6,
            ),
            Text(
              subheading,
              style: regularBodyTextL.copyWith(color: neutralTheme[300]),
            ),
          ],
        )
      ],
    );
  }
}
