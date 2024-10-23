import 'package:flutter/material.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';

class CustomDetailContainer extends StatelessWidget {
  final String title;
  final String content;
  const CustomDetailContainer(
      {super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: neutralTheme[100]!, width: 1.0))),
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 17.5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: regularBodyText.copyWith(color: neutralTheme[500]),
          ),
          Text(content, style: mediumBodyText),
        ],
      ),
    );
  }
}
