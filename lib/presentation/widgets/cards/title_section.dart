import 'package:flutter/material.dart';
import 'package:presience_app/presentation/utils/text.dart';

class TitleSection extends StatelessWidget {
  final String title;
  const TitleSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title, style: mediumBodyTextXL.copyWith());
  }
}
