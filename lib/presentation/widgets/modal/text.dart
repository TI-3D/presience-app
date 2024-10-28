
import 'package:flutter/material.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';

class DialogContentText extends StatelessWidget {
  final String title;
  final String subtitle;
  const DialogContentText({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: mediumBodyTextXL,
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          subtitle,
          style: regularBodyText.copyWith(color: neutralTheme[500]),
        ),
      ],
    );
  }
}
