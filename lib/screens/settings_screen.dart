import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../models/select-option/select_option_model.dart';
import '../models/widgets/screen_list_tile_widget_model.dart';
import '../router/route_utils.dart';
import '../services/theme_service.dart';
import '../utils/constants.dart';
import '../utils/responsive/responsive_layout.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/screen_list_tile_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeService readThemeService = context.read<ThemeService>();
    const String prefixTitle = "screens.settings.children";
    List<ScreenListTileWidgetModel> models = [
      ScreenListTileWidgetModel(
        index: 'language',
        icon: AppDefaultIcons.language,
        title: '$prefixTitle.language.title'.tr(),
        onTap: () {
          final supportedLanguages = AppSupportedLanguages.supportedLanguages;
          _showSettingsModalBottomSheet(
              context: context,
              currentValue: context.locale,
              items: supportedLanguages,
              onChanged: (value) async {
                final Locale language = value;
                await context
                    .setLocale(language)
                    .then((value) => context.pop());
              });
        },
      )
    ];
    return Scaffold(
      appBar: AppBarWidget(title: SCREENS.settings.toTitle),
      drawer:
          !ResponsiveLayout.isDesktop(context) ? const DrawerWidget() : null,
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            itemCount: models.length,
            itemBuilder: (context, index) {
              final model = models[index];
              return Padding(
                  padding: EdgeInsets.all(10),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child:  ScreenListTileWidget(model: model),
                    ),
                  ));
            },
          ),
        ),
      ]),
    );
  }

  Future<dynamic> _showSettingsModalBottomSheet(
      {required BuildContext context,
      required dynamic currentValue,
      required List<SelectOptionModel> items,
      void Function(dynamic)? onChanged}) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return RadioListTile(
              title: Text(item.label.tr()),
              value: item.value,
              groupValue: currentValue,
              onChanged: onChanged,
            );
          },
        );
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppStyleDefaultProperties.r),
        ),
      ),
    );
  }
}
