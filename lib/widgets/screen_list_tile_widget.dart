import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/widgets/screen_list_tile_widget_model.dart';
import '../services/theme_service.dart';
import '../utils/constants.dart';

class ScreenListTileWidget extends StatelessWidget {
  final ScreenListTileWidgetModel model;
  const ScreenListTileWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(model.icon),
      title: Text(model.title),
      onTap: model.onTap,
      trailing: Wrap(
        spacing: 8.0,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          if (model.index == "theme")
            Consumer<ThemeService>(
              builder: (context, state, child) => Text(AppThemes.themes
                  .firstWhere((theme) => theme.value == state.themeMode)
                  .label
                  .tr()),
            ),
          if (model.index == "language")
            Text(AppSupportedLanguages.supportedLanguages
                .firstWhere((language) => language.value == context.locale)
                .label
                .tr()),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}
