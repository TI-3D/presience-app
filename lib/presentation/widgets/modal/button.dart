import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/buttons/button.dart';
import 'package:presience_app/presentation/widgets/modal/text.dart';

class DialogContentButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final String label;
  final VoidCallback onPressed;
  final bool? isBack;
  final Color? buttonColor;

  const DialogContentButton({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onPressed,
    required this.label,
    this.isBack = false,
    this.buttonColor = purpleTheme,
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
        const SizedBox(
          height: 32,
        ),
        LargeFillButton(label: label, onPressed: onPressed, color: buttonColor),
        if (isBack != null && isBack == true) ...[
          const SizedBox(
            height: 4,
          ),
          LargeTextButton(
              label: "Batal",
              color: blackTheme,
              onPressed: () {
                context.pop();
              })
        ]
        // Container(
        //   width: double.infinity,
        // child: Row(
        //   mainAxisSize: MainAxisSize.max,
        //   children: [

        //   ],
        // ),
        // )
        // SizedBox(
        //   height: 20,
        // ),
      ],
    );
  }
}
