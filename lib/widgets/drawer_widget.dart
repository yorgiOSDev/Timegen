import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../router/route_utils.dart';
import '../services/auth_service.dart';
import '../services/route_service.dart';
import '../utils/responsive/responsive_layout.dart';
import 'drawer_header_widget.dart';
import 'drawer_list_tile_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<SCREENS> screens = [
      SCREENS.dashboard,
      SCREENS.profile,
      SCREENS.settings,
      SCREENS.attendances,
      SCREENS.routines
    ];
    final SCREENS loginScreen = SCREENS.logout;
    return Drawer(
        child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  height: 276,
                  padding: EdgeInsets.only(top: 64, bottom: 16),
                  child: Center(
                      child: SvgPicture.asset('assets/images/TG_logo1.svg', width: 196, height: 196,)
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: ListView.builder(
                        itemCount: screens.length,
                        itemBuilder: (context, index) {
                          final IconData icon = screens[index].toIcon;
                          final String pathName = screens[index].toName;
                          return DrawerListTileWidget(
                              index: index,
                              icon: icon,
                              title: screens[index].toTitle,
                              onTap: () {
                                // Close Drawer (Mobile & Tablet)
                                if (!ResponsiveLayout.isDesktop(context)) {
                                  context.pop();
                                }
                                // Go To Screen
                                context
                                    .read<RouteService>()
                                    .changeRouteIndexState(index);
                                context.goNamed(pathName);
                              });
                        }),
                  )
                )
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: DrawerListTileWidget(
                icon: loginScreen.toIcon,
                title: loginScreen.toTitle,
                onTap: () => context.read<AuthService>().logOut()),
          )
      ],
    ));
  }
}
