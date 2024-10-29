import 'package:flutter/material.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';

class TitleDetail extends StatelessWidget {
  final String title;
  final Widget? child;

  const TitleDetail({
    super.key,
    required this.title,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: regularBodyText.copyWith(color: neutralTheme[500]),
          ),
          child ?? Container(),
        ],
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
