import 'package:flutter/widgets.dart';
import 'package:fly_ui/transitions/flyRouteTransition.dart';
import 'package:get/get.dart';
import 'package:settings_module/routes/routes.dart';
import 'package:settings_module/settings/settings.binding.dart';
import 'package:settings_module/settings/settings.view.dart';

class SettingsPages {
  final List<Widget>? customSettings;
  SettingsPages({this.customSettings});
  List<GetPage<dynamic>> routes() => [
        //Join Share Case
        GetPage(
          name: SettingsRoutesNames.SETTINGS,
          page: () => SettingsView(customSettings: customSettings),
          binding: SettingsBinding(),
          customTransition: FlySharedAxisTransition(),
        ),
      ];
}
