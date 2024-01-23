import 'package:app_configuration_service/appInfo.config.dart';
import 'package:firebase_authentication_service/firebaseAuthentication.service.dart';
import 'package:firebase_authentication_service/models/baseUser.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/extensions/responsive.extension.dart';
import 'package:fly_ui/views/widgets/buttons/elevatedButton.widget.dart';
import 'package:fly_ui/views/widgets/buttons/iconButton.widget.dart';
import 'package:fly_ui/views/widgets/images/image.widget.dart';
import 'package:fly_ui/views/widgets/textField.widget.dart';
import 'package:get/get.dart';
import 'package:settings_module/editMyAccount/editMyAccount.controller.dart';
import 'package:unicons/unicons.dart';

class EditMyAccountView extends GetView<EditMyAccountController> {
  EditMyAccountView({
    Key? key,
  }) : super(key: key) {
    Get.lazyPut<EditMyAccountController>(() => EditMyAccountController());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Avatar
          Obx(
            () {
              // listen to user phot
              final BaseUser? avatar =
                  FirebaseAuthenticationService.to.user.value;

              //return
              return FlyImage(
                url: avatar?.photoUrl,
                height: 140.sp,
                width: double.maxFinite,
                actions: [
                  FlyIconButton(
                    icon: UniconsLine.pen,
                    onPressed: EditMyAccountController.to.pickAnImage,
                  ),
                ],
              );
            },
          ),

          // Obx(
          //   () => JSelectorOptionsArea(
          //     selectedOption: controller.typesOptionSelected.value,
          //     options: controller.typesOptions,
          //     onTap: controller.changeProviderType,
          //   ),
          // ),

          // Padding for top
          SizedBox(height: 10.sp),

          // /DisplayName
          Form(
            key: controller.form,
            child: Column(
              children: [
                FlyTextField(
                  labelText: "Your name".tr,
                  textInputType: TextInputType.text,
                  color: Get.theme.scaffoldBackgroundColor,
                  controller: controller.displayNameController,
                  validator: (String? v) => controller.displayNameValidation(v),
                ),
                FlyTextField(
                  labelText: "Brief (optional)".tr,
                  maxLines: 4,
                  textInputType: TextInputType.text,
                  color: Get.theme.scaffoldBackgroundColor,
                  controller: controller.briefController,
                ),
                FlyTextField(
                  labelText: "Facebook Username (optional)".tr,
                  textInputType: TextInputType.text,
                  color: Get.theme.scaffoldBackgroundColor,
                  controller: controller.facebookController,
                ),
                FlyTextField(
                  labelText: "Twitter Username (optional)".tr,
                  textInputType: TextInputType.text,
                  color: Get.theme.scaffoldBackgroundColor,
                  controller: controller.twitterController,
                ),
                FlyTextField(
                  labelText: "Instagram Username (optional)".tr,
                  textInputType: TextInputType.text,
                  color: Get.theme.scaffoldBackgroundColor,
                  controller: controller.instagramController,
                ),
                FlyTextField(
                  labelText: "TikTok Username (optional)".tr,
                  textInputType: TextInputType.text,
                  color: Get.theme.scaffoldBackgroundColor,
                  controller: controller.tiktokController,
                ),
              ],
            ),
          ),

          // Padding for top
          SizedBox(height: AppConfigService.to.space!.m),

          FlyElevatedButton.primary(
            title: 'Save'.tr,
            onPressed: controller.save,
          )
        ],
      ),
    );
  }
}
