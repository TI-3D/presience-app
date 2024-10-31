import 'package:flutter/material.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';

class EmptyStateText extends StatelessWidget {
  const EmptyStateText({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: mediumBodyTextXL.copyWith(color: blackTheme),
        ),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: regularBodyText.copyWith(color: neutralTheme[500]),
        ),
      ],
    );
  }
}
