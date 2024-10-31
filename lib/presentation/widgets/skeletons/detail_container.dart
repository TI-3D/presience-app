import 'package:flutter/material.dart';
import 'package:presience_app/presentation/utils/theme.dart';
import 'package:presience_app/presentation/widgets/containers/content.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FirstDetailContainerSkeleton extends StatelessWidget {
  final List<Widget> children;
  const FirstDetailContainerSkeleton(
      {super.key, this.children = const <Widget>[]});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      containersColor: neutralTheme[50],
      enabled: true, // Flag to toggle skeleton
      enableSwitchAnimation: true, //
      child: Container(
        constraints: const BoxConstraints(minHeight: 52),
        decoration: BoxDecoration(
            color: neutralTheme[50],
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
            children: [
              TitleDetail(title: BoneMock.name),
              ValueDetail(content: BoneMock.fullName)
            ]),
      ),
    );
  }
}

class MiddleDetailContainerSkeleton extends StatelessWidget {
  final List<Widget> children;
  const MiddleDetailContainerSkeleton(
      {super.key, this.children = const <Widget>[]});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      containersColor: neutralTheme[50],
      enabled: true, // Flag to toggle skeleton
      enableSwitchAnimation: true, //
      child: Container(
        constraints: const BoxConstraints(minHeight: 52),
        decoration: BoxDecoration(
            color: neutralTheme[50],
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
            children: [
              TitleDetail(title: BoneMock.name),
              ValueDetail(content: BoneMock.fullName)
            ]),
      ),
    );
  }
}

class LastDetailContainerSkeleton extends StatelessWidget {
  final List<Widget> children;
  const LastDetailContainerSkeleton(
      {super.key, this.children = const <Widget>[]});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      containersColor: neutralTheme[50],
      enabled: true, // Flag to toggle skeleton
      enableSwitchAnimation: true, //
      child: Container(
        constraints: const BoxConstraints(minHeight: 52),
        decoration: BoxDecoration(
            color: neutralTheme[50],
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
            children: [
              TitleDetail(title: BoneMock.name),
              ValueDetail(content: BoneMock.fullName)
            ]),
      ),
    );
  }
}
