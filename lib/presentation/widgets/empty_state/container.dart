import 'package:flutter/material.dart';
import 'package:presience_app/presentation/widgets/buttons/button.dart';
import 'package:presience_app/presentation/widgets/empty_state/text.dart';

class CustomContainerEmptyState extends StatelessWidget {
  final double? width;
  final Widget image;
  final String title;
  final String subtitle;
  final bool? isButtonVisible;
  final String? label;
  final VoidCallback? onPressed;

  const CustomContainerEmptyState({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    this.label,
    this.onPressed,
    this.isButtonVisible,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          image,
          EmptyStateText(title: title, subtitle: subtitle),
          if (isButtonVisible == true) ...[
            const SizedBox(
              height: 24,
            ),
            SmallFillButton(label: label!, onPressed: onPressed ?? () {}),
          ],
        ],
      ),
    );
  }
}
