import 'package:flutter/material.dart';
import 'package:presience_app/presentation/utils/theme.dart';

class CustomFirstDetailContainer extends StatelessWidget {
  final List<Widget> children;
  const CustomFirstDetailContainer(
      {super.key, this.children = const <Widget>[]});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 52),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0)),
          border: Border(
            left: BorderSide(color: neutralTheme[100]!, width: 1.0),
            right: BorderSide(color: neutralTheme[100]!, width: 1.0),
            top: BorderSide(color: neutralTheme[100]!, width: 1.0),
            bottom: BorderSide(color: neutralTheme[100]!, width: 1.0),
          )),
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 17.5),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children),
    );
  }
}

class CustomMiddleDetailContainer extends StatelessWidget {
  final List<Widget> children;
  const CustomMiddleDetailContainer(
      {super.key, this.children = const <Widget>[]});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 52),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(0),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0)),
          border: Border(
            left: BorderSide(color: neutralTheme[100]!, width: 1.0),
            right: BorderSide(color: neutralTheme[100]!, width: 1.0),
            // top: BorderSide(color: neutralTheme[100]!, width: 1.0),
            bottom: BorderSide(color: neutralTheme[100]!, width: 1.0),
          )),
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 17.5),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children),
    );
  }
}

class CustomLastDetailContainer extends StatelessWidget {
  final List<Widget> children;
  const CustomLastDetailContainer(
      {super.key, this.children = const <Widget>[]});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 52),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(0),
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8)),
          border: Border(
            left: BorderSide(color: neutralTheme[100]!, width: 1.0),
            right: BorderSide(color: neutralTheme[100]!, width: 1.0),
            // top: BorderSide(color: neutralTheme[100]!, width: 1.0),
            bottom: BorderSide(color: neutralTheme[100]!, width: 1.0),
          )),
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 17.5),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children),
    );
  }
}
