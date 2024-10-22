import 'package:flutter/material.dart';
import 'package:presience_app/presentation/utils/text.dart';

class CustomIconLabel extends StatelessWidget {
  final String label;
  final Color color;
  final IconData icon;

  const CustomIconLabel(
      {super.key,
      required this.label,
      required this.icon,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 14,
          color: color,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          label,
          style: mediumBodyTextS.copyWith(
            color: color,
          ),
        )
      ],
    );
  }
}
