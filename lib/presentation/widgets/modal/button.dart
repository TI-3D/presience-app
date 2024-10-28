
import 'package:flutter/material.dart';
import 'package:presience_app/presentation/widgets/buttons/button.dart';
import 'package:presience_app/presentation/widgets/modal/text.dart';

class DialogContentButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final String label;
  final VoidCallback onPressed;
  const DialogContentButton({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        DialogContentText(
          title: title,
          subtitle: subtitle,
        ),
        SizedBox(
          height: 32,
        ),
        LargeFillButton(label: label, onPressed: onPressed)
        // SizedBox(
        //   height: 20,
        // ),
      ],
    );
  }
}
