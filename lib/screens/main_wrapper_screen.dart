import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/responsive/responsive_layout.dart';
import '../widgets/bottom_nav_bar_widget.dart';
import '../widgets/drawer_widget.dart';

class MainWrapperScreen extends StatelessWidget {
  // route-view
  final StatefulNavigationShell navigationShell;
  const MainWrapperScreen({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    final Scaffold mobileAndTabletScaffold = Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottonNavBarWidget(navigationShell: navigationShell),
    );
    final Scaffold desktopScaffold = Scaffold(
      body: Row(children: [
        const DrawerWidget(),
        Expanded(child: navigationShell),
      ]),
    );
    return ResponsiveLayout(
      mobileScaffold: mobileAndTabletScaffold,
      tabletScaffold: mobileAndTabletScaffold,
      desktopScaffold: desktopScaffold,
    );
  }
}
