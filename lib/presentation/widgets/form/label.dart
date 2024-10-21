import 'package:flutter/material.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';

class FieldLabel extends StatelessWidget {
  final String label;
  final bool? isOptional;

  const FieldLabel({super.key, required this.label, this.isOptional});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        label,
        style: mediumBodyText,
      ),
      const SizedBox(width: 4),
      if (isOptional != null && isOptional!)
        (Text(
          "(Opsional)",
          style: mediumBodyText.copyWith(color: neutralTheme[200]),
        )),
    ]);
  }
}
