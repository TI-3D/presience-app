import 'package:flutter/material.dart';
import 'package:presience_app/presentation/utils/theme.dart';

class CustomCard extends StatelessWidget {
  final Widget? child;
  final GestureTapCallback? onTap;
  final double? width;
  const CustomCard({super.key, this.onTap, this.child, this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: neutralTheme,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: neutralTheme[100]!)),
        child: child,
      ),
    );
  }
}
