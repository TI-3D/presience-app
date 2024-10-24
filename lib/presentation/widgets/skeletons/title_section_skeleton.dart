import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SectionTitleSkeleton extends StatelessWidget {
  const SectionTitleSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(child: 
      Bone.text()
    );
  }
}