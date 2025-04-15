import 'package:flutter/material.dart';
import 'package:fly_ui/views/layouts/landscapeView.widget.dart';
import 'package:fly_ui/views/widgets/appBar.widget.dart';
import 'package:get/get.dart';
import 'package:settings_module/settings/widgets/settingPageOptionsList.widget.dart';
import '../settings.controller.dart';

class LandscapeLayout extends GetView<SettingsController> {
  const LandscapeLayout({
    Key? key,
    this.customSettings,
  }) : super(key: key);

  final List<Widget>? customSettings;
  @override
  Widget build(BuildContext context) {
    return FlyLandscapeView(
      childA: Column(
        children: [
          FlyAppBar(
            title: 'Settings'.tr,
          ),
        ],
      ),
      childB: SettingPageOptionsList(customSettings: customSettings),
    );
  }
}
