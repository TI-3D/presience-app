import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:presience_app/presentation/utils/methods.dart';
import 'package:presience_app/presentation/utils/text.dart';
import 'package:presience_app/presentation/utils/theme.dart';

class CustomRadioDesc extends StatelessWidget {
  final String value;
  final String description;
  final bool isSelected;
  final GestureTapCallback? onTap;
  const CustomRadioDesc({
    super.key,
    required this.value,
    required this.description,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? purpleTheme[200]! : neutralTheme[200]!,
            width: 1.0,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                border: Border(
                  bottom: BorderSide(
                    color: isSelected ? purpleTheme[200]! : neutralTheme[200]!,
                    width: 1.0,
                  ),
                ),
                color: isSelected ? purpleTheme[100]! : neutralTheme,
              ),
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(capitalize(value),
                          style: mediumBodyText.copyWith(
                              color: isSelected ? purpleTheme : blackTheme)),
                      const SizedBox(width: 8),
                      Icon(
                        isSelected
                            ? TablerIcons.circle_check
                            : TablerIcons.circle,
                        size: 20,
                        color: isSelected ? purpleTheme : blackTheme,
                      ),
                    ],
                  ),
                ],
              ),

              // Text("Sakit", style: mediumBodyText),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Text(
                description,
                style: mediumBodyTextS.copyWith(color: neutralTheme[500]!),
              ),
            )
          ],
        ),
      ),
    );
  }
}
