import 'package:flutter/material.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';

class CustomTextLabel extends StatelessWidget {
  final String label;
  final String value;

  const CustomTextLabel({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label, style: mediumBodyTextS.copyWith(color: neutralTheme[300])),
      Text(value, style: mediumBodyTextL.copyWith(color: blackTheme)),
    ]);
  }
}
