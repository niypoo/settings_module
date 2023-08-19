import 'package:app_configuration_service/appInfo.config.dart';
import 'package:flutter/material.dart';
import 'package:settings_module/settings/settings.controller.dart';
import 'package:settings_module/settings/widgets/settingPageOptionsList.widget.dart';
import 'package:get/get.dart';

class PortraitLayout extends GetView<SettingsController> {
  const PortraitLayout({
    Key? key,
    this.customSettings,
  }) : super(key: key);

  final List<Widget>? customSettings;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: AppConfigService.to.space!.xxl),
      child: SettingPageOptionsList(
        customSettings: customSettings,
      ),
    );
  }
}
