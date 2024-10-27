import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:presience_app/presentation/utils/theme.dart';

class CameraButtons extends StatelessWidget {
  final GestureTapCallback onTapCamera;
  final GestureTapCallback onTapBack;
  final GestureTapCallback onTapRotateCamera;
  const CameraButtons(
      {super.key,
      required this.onTapCamera,
      required this.onTapBack,
      required this.onTapRotateCamera});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(child: Container()),
      SizedBox(
        width: double.infinity,
        height: 200,
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: onTapBack,
                    child: Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                          color: neutralTheme,
                          borderRadius: BorderRadius.circular(100)),
                      child: const Center(
                        child: Icon(
                          TablerIcons.arrow_left,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 84,
                    height: 84,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 4, color: neutralTheme),
                              borderRadius: BorderRadius.circular(100)),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          child: GestureDetector(
                            onTap: onTapCamera,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: neutralTheme,
                                  borderRadius: BorderRadius.circular(100)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: onTapRotateCamera,
                    child: Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                          color: neutralTheme,
                          borderRadius: BorderRadius.circular(100)),
                      child: const Center(
                        child: Icon(
                          TablerIcons.camera_rotate,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ]);
  }
}
