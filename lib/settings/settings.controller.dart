import 'package:app_configuration_service/appInfo.config.dart';
import 'package:bottom_sheet_helper/models/actionSheetOption.model.dart';
import 'package:bottom_sheet_helper/services/actionSheet.helper.dart';
import 'package:bottom_sheet_helper/services/customBottomSheet.helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:launch_url_helper/launchURL.service.dart';
import 'package:unicons/unicons.dart';

import '../editMyAccount/editMyAccount.view.dart';

class SettingsController extends GetxController {
  // define
  static SettingsController get to => Get.find();

  // show options menu
  Future<void> onContactUsMenuShow() async {
    // show menu option
    final String? payload = await ActionSheetHelper.show(
      title: 'Contact us'.tr,
      subTitle:
          'Facing a issue and need help! have an idea please feel free.'.tr,
      options: [
        ActionSheetOption(
          title: 'Problem Found'.tr,
          value: 'bug',
          leading: const Icon(UniconsLine.bug),
        ),
        ActionSheetOption(
          title: 'Feature Missing'.tr,
          value: 'feature',
          leading: const Icon(UniconsLine.star_half_alt),
        ),
      ],
      height: null,
    ) as String?;

    // skip
    if (payload == null) return;

    // in delete case
    if (payload == 'bug') {
      LaunchUrlHelper.toEmail(
        email: AppConfigService.to.supportEmail,
        subject: "Problem Found".tr,
      );
    }

    // in edit weight case
    if (payload == 'feature') {
      LaunchUrlHelper.toEmail(
        email: AppConfigService.to.supportEmail,
        subject: "Feature Missing".tr,
      );
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
        subTitle:
            'Write your real name and upload your photo to make others address you correctly.'
                .tr,
        child: EditMyAccountView(),
      );
}
