import 'package:flutter/material.dart';
import 'package:presience_app/presentation/utils/text.dart';

class CustomLargeIconLabel extends StatelessWidget {
  final String label;
  final Color color;
  final IconData icon;

  const CustomLargeIconLabel(
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
          size: 18,
          color: color,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          label,
          style: mediumBodyTextL.copyWith(
            color: color,
          ),
        )
      ],
    );
  }
}

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

class CustomSmallIconLabel extends StatelessWidget {
  final String label;
  final Color color;
  final IconData icon;

  const CustomSmallIconLabel(
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
          size: 12,
          color: color,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          label,
          style: mediumSmallText.copyWith(
            color: color,
          ),
        )
      ],
    );
  }
}
