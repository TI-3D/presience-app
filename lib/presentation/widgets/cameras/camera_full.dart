import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraFullRatio extends StatelessWidget {
  const CameraFullRatio({
    super.key,
    required this.controller,
  });

  final CameraController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FittedBox(
          fit: BoxFit.cover,
          child: SizedBox(
            width: 100, // the actual width is not important here
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(
                  controller.description.lensDirection ==
                          CameraLensDirection.front
                      ? 3.14
                      : 0),
              child: CameraPreview(controller),
            ),
          ),
        ));
  }
}
