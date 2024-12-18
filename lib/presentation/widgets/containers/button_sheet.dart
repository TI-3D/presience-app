import 'package:flutter/material.dart';
import 'package:presience_app/presentation/utils/theme.dart';

class CustomButtomSheet extends StatelessWidget {
  final Widget? child;
  const CustomButtomSheet({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      constraints: const BoxConstraints(minHeight: 10),
      decoration: const BoxDecoration(
        color: neutralTheme,
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      child: child,
    );
  }
}
