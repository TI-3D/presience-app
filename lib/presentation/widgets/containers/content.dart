import 'package:flutter/material.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';

class TitleDetail extends StatelessWidget {
  const TitleDetail({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        title,
        style: regularBodyText.copyWith(color: neutralTheme[500]),
      ),
    );
  }
}


class ValueDetail extends StatelessWidget {
  const ValueDetail({
    super.key,
    required this.content,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Text(
      content,
      style: mediumBodyText,
      textAlign: TextAlign.right,
    ));
  }
}
