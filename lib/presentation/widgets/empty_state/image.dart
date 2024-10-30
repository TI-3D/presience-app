import 'package:flutter/material.dart';

class LargeEmptyStateImage extends StatelessWidget {
  const LargeEmptyStateImage({
    super.key,
    required this.assetPath,
  });

  final String assetPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240, // Sesuaikan lebar container gambar
      height: 240, // Sesuaikan tinggi container gambar
      child: Image.asset(
        assetPath, // Path gambar lokal
        fit: BoxFit.cover,
      ),
    );
  }
}

class SmallEmptyStateImage extends StatelessWidget {
  const SmallEmptyStateImage({
    super.key,
    required this.assetPath,
  });

  final String assetPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 117, // Sesuaikan lebar container gambar
      height: 117, // Sesuaikan tinggi container gambar
      child: Image.asset(
        assetPath, // Path gambar lokal
        fit: BoxFit.cover,
      ),
    );
  }
}