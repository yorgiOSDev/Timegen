import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/theme_service.dart';
import '../utils/constants.dart';

class ToggleSwitchThemeWidget extends StatelessWidget {
  const ToggleSwitchThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Consumer<ThemeService>(
      builder: (context, state, child) =>
          AnimatedToggleSwitch<ThemeMode>.rolling(
        current: state.themeMode,
        values:
            AppThemes.themes.map((theme) => theme.value as ThemeMode).toList(),
        onChanged: (ThemeMode themeMode) =>
            context.read<ThemeService>().switchTheme(themeMode),
        // iconBuilder: iconBuilder,
        iconList: AppThemes.themes.map((theme) => Icon(theme.icon)).toList(),
        style: ToggleStyle(
          indicatorColor: theme.colorScheme.surface,
          borderColor: Colors.transparent,
        ),
      ),
    );
  }
}
