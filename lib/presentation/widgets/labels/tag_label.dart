import 'package:flutter/material.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';

class TagLabel extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;

  const TagLabel(
      {super.key,
      required this.label,
      required this.backgroundColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        color: backgroundColor,
        child: Center(
          child:
              Text(label, style: mediumBodyTextXS.copyWith(color: textColor)),
        ),
      ),
    );
  }
}

class CustomTaglabelGrey extends StatelessWidget {
  final String label;

  const CustomTaglabelGrey({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return TagLabel(
        label: label,
        backgroundColor: neutralTheme[100]!,
        textColor: neutralTheme[300]!);
  }
}

class CustomTaglabelPurple extends StatelessWidget {
  final String label;

  const CustomTaglabelPurple({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return TagLabel(
        label: label,
        backgroundColor: purpleTheme[100]!,
        textColor: purpleTheme[950]!);
  }
}

class CustomTaglabelGreen extends StatelessWidget {
  final String label;

  const CustomTaglabelGreen({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return TagLabel(
        label: label,
        backgroundColor: greenTheme[100]!,
        textColor: greenTheme[500]!);
  }
}

class CustomTaglabelRed extends StatelessWidget {
  final String label;

  const CustomTaglabelRed({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return TagLabel(
        label: label,
        backgroundColor: redTheme[100]!,
        textColor: redTheme[600]!);
  }
}

class CustomTaglabelOrange extends StatelessWidget {
  final String label;

  const CustomTaglabelOrange({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return TagLabel(
        label: label,
        backgroundColor: orangeTheme[100]!,
        textColor: orangeTheme[500]!);
  }
}
