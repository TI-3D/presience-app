import 'package:flutter/material.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';

class CustomButtomNavigationMenuItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final int index;
  final int selectedPageIndex;
  final Function(int) onTap;

  const CustomButtomNavigationMenuItem(
      {super.key,
      required this.label,
      required this.icon,
      required this.index,
      required this.selectedPageIndex,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        child: Container(
          color: neutralTheme,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 24,
                color: selectedPageIndex == index
                    ? blackTheme
                    : neutralTheme[400]!,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                label,
                style: selectedPageIndex == index
                    ? mediumBodyText.copyWith(
                        color: blackTheme, fontWeight: FontWeight.w700)
                    : regularBodyText.copyWith(
                        color: neutralTheme[400]!, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
