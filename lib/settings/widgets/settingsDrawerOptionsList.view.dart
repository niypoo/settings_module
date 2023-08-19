import 'package:authentication_view_module/views/widgets/changeToPermanentSettingCard.widget.dart';
import 'package:authentication_view_module/views/widgets/deleteMyAccountSettingCard.widget.dart';
import 'package:authentication_view_module/views/widgets/signoutSettingCard.widget.dart';
import 'package:flutter/widgets.dart';
import 'package:fly_ui/views/drawer/widgets/drawerButton.widget.dart';
import 'package:fly_ui/views/drawer/widgets/drawerSectionTitle.widget.dart';
import 'package:get/get.dart';
import 'package:localization_service/views/localizationDrawerSettingCard.widget.dart';
import 'package:settings_module/settings/settings.controller.dart';
import 'package:theme_service/views/widgets/themeDrawerSettingCard.widget%20copy.dart';
import 'package:unicons/unicons.dart';

class SettingsDrawerOptions extends GetView<SettingsController> {
  const SettingsDrawerOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlyDrawerSectionTitle(title: 'Settings'.tr),
        const LocalizationDrawerSettingCard(),
        const ThemeDrawerSettingCard(),
        FlyDrawerButton(
          icon: UniconsLine.user,
          onTap: controller.toEditMyAccount,
          title: 'My Account Info'.tr,
        ),
        FlyDrawerButton(
          icon: UniconsLine.mailbox,
          onTap: controller.onContactUsMenuShow,
          title: 'Contact us'.tr,
        ),

        /////////////////
        ///isAnonymous//
        ///////////////
        const ChangeToPermanentDrawerSettingCard(),

        //DELETE
        const DeleteMyAccountDrawerSettingCard(),

        // Sign Out
        const SignOutDrawerSettingCard(),
      ],
    );
  }
}
