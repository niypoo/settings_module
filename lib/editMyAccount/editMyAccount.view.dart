import 'package:app_configuration_service/appInfo.config.dart';
import 'package:firebase_authentication_service/firebaseAuthentication.service.dart';
import 'package:firebase_authentication_service/models/baseUser.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return Column(
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
              height: context.isLandscape
                  ? context.height * 0.4
                  : context.width * 0.4,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FlyIconButton(
                    icon: UniconsLine.pen,
                    margin: EdgeInsets.all(AppConfigService.to.space!.s),
                    onPressed: EditMyAccountController.to.pickAnImage,
                  ),
                ],
              ),
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
        SizedBox(height: AppConfigService.to.space!.m),
        // /DisplayName
        Form(
          key: controller.form,
          child: FlyTextField(
            labelText: "Your name".tr,
            textInputType: TextInputType.text,
            color: Get.theme.scaffoldBackgroundColor,
            controller: controller.displayNameController,
            validator: (String? v) => controller.displayNameValidation(v),
          ),
        ),

        // Padding for top
        SizedBox(height: AppConfigService.to.space!.m),

        FlyElevatedButton.primary(
          title: 'Save'.tr,
          onPressed: controller.save,
        )
      ],
    );
  }
}
