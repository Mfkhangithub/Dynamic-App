import 'package:flutter/material.dart';

class Resposive_layout extends StatelessWidget {
  final Widget MobileApp;
  final Widget TabletApp;
  final Widget DesktopApp;
  const Resposive_layout(
      {super.key,
      required this.MobileApp,
      required this.DesktopApp,
      required this.TabletApp});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 700) {
          return MobileApp;
        } else if (constraints.maxWidth < 1100) {
          return TabletApp;
        } else {
          return DesktopApp;
        }
      },
    );
  }
}
