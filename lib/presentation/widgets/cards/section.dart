import 'package:flutter/material.dart';
import 'package:presience_app/presentation/utils/text.dart';

class CustomSection extends StatelessWidget {
  final String title;
  final Widget child;

  const CustomSection({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: mediumBodyTextL),
        const SizedBox(
          height: 8,
        ),
        child
      ]),
    );
  }
}
