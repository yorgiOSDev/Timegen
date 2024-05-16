import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/app_service.dart';
import 'toggle_switch_theme_widget.dart';

class AppBarDashboardWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppBarDashboardWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(context.tr(title)),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: IconButton(
              icon: Icon(
                Icons.refresh, // Este es un ejemplo, reemplázalo con el icono 'run' que desees
                size: 32,
              ),
              onPressed: () {
                Provider.of<AppService>(context, listen: false).notifyListeners();
              }
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
