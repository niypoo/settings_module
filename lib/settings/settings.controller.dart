import 'package:app_configuration_service/appInfo.config.dart';
import 'package:bottom_sheet_helper/models/actionSheetOption.model.dart';
import 'package:bottom_sheet_helper/services/actionSheet.helper.dart';
import 'package:bottom_sheet_helper/services/customBottomSheet.helper.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:get/get.dart';
import 'package:launch_url_helper/launchURL.service.dart';
import 'package:unicons/unicons.dart';

import '../editMyAccount/editMyAccount.view.dart';

class SettingsController extends GetxController {
  // define
  static SettingsController get to => Get.find();

  // show options menu
  Future<void> onContactUsMenuShow() async {
    try {
      // show menu option
      final String? payload = await ActionSheetHelper.show(
        title: 'Contact us'.tr,
        subTitle:
            'Facing a issue and need help! have an idea please feel free.'.tr,
        options: [
          ActionSheetOption(
            title: 'Problem Found'.tr,
            value: 'ISSUE',
            leading: const Icon(UniconsLine.bug),
          ),
          ActionSheetOption(
            title: 'Feature Missing'.tr,
            value: 'FEATURE',
            leading: const Icon(UniconsLine.star_half_alt),
          ),
        ],
        height: null,
      );

      // skip
      if (payload == null) return;

      LaunchUrlHelper.toEmail(
        email: AppConfigService.to.supportEmail,
        subject: "${AppConfigService.to.appName}-$payload".tr,
      );
    } catch (e) {
      print('ERROR $e');
    }
  }

  // show alert guest
  void guestWarning() {
    CustomBottomSheetHelper.show(
      title: "Warning".tr,
      subTitle: "Guest Warning".tr,
      icon: UniconsLine.user_exclamation,
    );
  }

  void toEditMyAccount() => CustomBottomSheetHelper.show(
        title: 'Update your account'.tr,
        height: 90.h,
        subTitle:
            'Write your real name and upload your photo to make others address you correctly.'
                .tr,
        child: EditMyAccountView(),
      );
}
