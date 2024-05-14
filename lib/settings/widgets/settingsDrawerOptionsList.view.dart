import 'package:app_configuration_service/appInfo.config.dart';
import 'package:authentication_view_module/views/widgets/changeToPermanentSettingCard.widget.dart';
import 'package:authentication_view_module/views/widgets/deleteMyAccountSettingCard.widget.dart';
import 'package:authentication_view_module/views/widgets/signoutSettingCard.widget.dart';
import 'package:flutter/widgets.dart';
import 'package:fly_ui/views/drawer/widgets/drawerButton.widget.dart';
import 'package:fly_ui/views/drawer/widgets/drawerSectionTitle.widget.dart';
import 'package:get/get.dart';
import 'package:launch_url_helper/launchURL.service.dart';
import 'package:localization_service/views/localizationDrawerSettingCard.widget.dart';
import 'package:settings_module/settings/settings.controller.dart';
import 'package:theme_service/views/widgets/themeDrawerSettingCard.widget.dart';
import 'package:unicons/unicons.dart';

class SettingsDrawerOptions extends GetView<SettingsController> {
  const SettingsDrawerOptions({
    Key? key,
    this.enableContactUs = true,
    this.enablePermanentAccount = true,
    this.enableDeleteMyAccount = true,
    this.enableSignOut = true,
    this.enableLocalization = true,
    this.enableTheme = true,
    this.children = const [],
  }) : super(key: key);

  final bool enableLocalization;
  final bool enableTheme;
  final bool enableContactUs;
  final bool enablePermanentAccount;
  final bool enableDeleteMyAccount;
  final bool enableSignOut;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlyDrawerSectionTitle(title: 'Settings'.tr),

        if (enableLocalization) const LocalizationDrawerSettingCard(),

        if (enableTheme) const ThemeDrawerSettingCard(),

        // children
        ...children,

        // Tutorial
        if (AppConfigService.to.tutorialLink != null)
          FlyDrawerButton(
            icon: UniconsLine.lock,
            onTap: () =>
                LaunchUrlHelper.toUrl(AppConfigService.to.tutorialLink!),
            title: 'Tutorial'.tr,
          ),

        if (enableContactUs)
          FlyDrawerButton(
            icon: UniconsLine.mailbox,
            onTap: controller.onContactUsMenuShow,
            title: 'Contact us'.tr,
          ),

        FlyDrawerButton(
          icon: UniconsLine.lock,
          onTap: () => LaunchUrlHelper.toUrl(AppConfigService.to.privacyUrl),
          title: 'Privacy Policy'.tr,
        ),

        FlyDrawerButton(
          icon: UniconsLine.file_contract,
          onTap: () => LaunchUrlHelper.toUrl(AppConfigService.to.termsUrl),
          title: 'Terms'.tr,
        ),

        /////////////////
        ///isAnonymous//
        ///////////////
        if (enablePermanentAccount) const ChangeToPermanentDrawerSettingCard(),

        //DELETE
        if (enableDeleteMyAccount) const DeleteMyAccountDrawerSettingCard(),

        // Sign Out
        if (enableSignOut) const SignOutDrawerSettingCard(),
      ],
    );
  }
}
