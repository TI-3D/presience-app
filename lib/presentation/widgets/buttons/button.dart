import 'package:flutter/material.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';

class LargeFillButton extends StatelessWidget {
  final String label;
  final double? width;
  final VoidCallback onPressed;
  final bool? isDisabled;

  const LargeFillButton(
      {super.key,
      required this.label,
      required this.onPressed,
      this.width,
      this.isDisabled});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isDisabled != true ? onPressed : null,
      child: Container(
        height: 48,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        // if (width != null) width: width,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isDisabled != true ? purpleTheme : neutralTheme[300],
        ),
        child: Center(
          child: Text(
            label,
            style: mediumBodyText.copyWith(color: neutralTheme),
          ),
        ),
      ),
    );
  }
}

class SmallFillButton extends StatelessWidget {
  final String label;
  final double? width;
  final VoidCallback onPressed;
  final bool? isDisabled;

  const SmallFillButton(
      {super.key,
      required this.label,
      required this.onPressed,
      this.width,
      this.isDisabled});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isDisabled != true ? onPressed : null,
      child: Container(
        height: 36,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        // if (width != null) width: width,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isDisabled != true ? purpleTheme : neutralTheme[300],
        ),
        child: Center(
          child: Text(
            label,
            style: mediumBodyText.copyWith(color: neutralTheme),
          ),
        ),
      ),
    );
  }
}
