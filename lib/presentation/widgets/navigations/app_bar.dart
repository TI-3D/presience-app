import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final GestureTapCallback? onTap;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(MediaQuery.of(context).size.width, 120),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 120,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: neutralTheme[200]!,
              width: 1, // Ketebalan garis
            ),
          ),
        ),
        child: Stack(children: [
          GestureDetector(
            onTap: onTap,
            child: const SizedBox(
              height: double.infinity,
              child: Icon(
                TablerIcons.arrow_left,
                size: 28,
              ),
            ),
          ),
          Center(
            child: Text(
              title,
              style: mediumBodyTextXL.copyWith(
                color: blackTheme,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
