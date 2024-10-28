
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:presience_app/presentation/widgets/modal/dialog.dart';
import 'package:presience_app/presentation/widgets/modal/text.dart';

class DialogContentLoading extends StatelessWidget {
  final String title;
  final String subtitle;
  const DialogContentLoading({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Lottie.asset(
            'assets/lottie/lottie-loading.json',
            width: 160,
          ),
        ]),
        // SizedBox(
        //   height: 20,
        // ),
        DialogContentText(
          title: title,
          subtitle: subtitle,
        )
      ],
    );
  }
}
