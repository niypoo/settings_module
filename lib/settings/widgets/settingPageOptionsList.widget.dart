import 'package:authentication_view_module/views/widgets/changeToPermanentSettingCard.widget.dart';
import 'package:authentication_view_module/views/widgets/deleteMyAccountSettingCard.widget.dart';
import 'package:authentication_view_module/views/widgets/signoutSettingCard.widget.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/views/cards/settingIconCard.widget.dart';
import 'package:fly_ui/views/widgets/titleHeadline.widget.dart';
import 'package:get/get.dart';
import 'package:localization_service/views/localizationSettingCard.widget.dart';
import 'package:settings_module/settings/settings.controller.dart';
import 'package:theme_service/views/widgets/themeSettingCard.widget.dart';

class SettingPageOptionsList extends GetView<SettingsController> {
  const SettingPageOptionsList({
    Key? key,
    this.customSettings,
  }) : super(key: key);

  final List<Widget>? customSettings;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlyHeadline(title: 'Settings'.tr),

        const LocalizationSettingCard(),

        // Theme
        const ThemeSettingCard(),

        // custom settings
        if (customSettings != null) ...customSettings!,

        FlyHeadline(title: 'Need Help'.tr),

        FlySettingIconCard(
          onTap: controller.onContactUsMenuShow,
          title: 'Contact us'.tr,
        ),

        // title
        FlyHeadline(title: 'Account & Data'.tr),

        /////////////////
        ///isAnonymous//
        ///////////////
        const ChangeToPermanentSettingCard(),

        //DELETE
        const DeleteMyAccountSettingCard(),

        // Sign Out
        const SignOutSettingCard(),
      ],
    );
  }
}
