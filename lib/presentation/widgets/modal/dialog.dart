import 'package:flutter/material.dart';
import 'package:presience_app/presentation/utils/theme.dart';

class CustomDialog extends StatelessWidget {
  final Widget? child;
  const CustomDialog({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: const EdgeInsets.all(16),
      duration: const Duration(milliseconds: 100),
      curve: Curves.decelerate,
      child: Align(
        alignment: Alignment.center,
        child: Material(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: neutralTheme,
          type: MaterialType.card,
          child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: child),
        ),
      ),
    );
  }
}
