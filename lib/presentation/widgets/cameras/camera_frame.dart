import 'package:flutter/material.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';

class CameraFrame extends StatelessWidget {
  const CameraFrame({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/default/camera_frame2.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Container(
          padding: EdgeInsets.only(top: 52),
          width: double.infinity,
          child: Text(
            "Arahkan Wajah Pada Bingkai",
            style: heading2.copyWith(
              color: neutralTheme,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
