import 'package:app_configuration_service/appInfo.config.dart';
import 'package:flutter/material.dart';
import 'package:fly_ui/views/widgets/containers/container.widget.dart';
import 'package:get/get.dart';
import 'package:unicons/unicons.dart';

class SettingRateApp extends StatelessWidget {
  const SettingRateApp({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap as void Function()?,
      borderRadius: BorderRadius.circular(AppConfigService.to.radius),
      child: FlyContainer(
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(Config.smMergin),
            //   child: Text(
            //     "Rate the Jidaa".tr,
            //     style: Get.textTheme.headline3,
            //   ),
            // ),
            Text(
              "We are working hard for a better user experience. We'd greatly appreciate if you can rate us."
                  .tr,
              style: Get.textTheme.subtitle2,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.all(AppConfigService.to.space!.s),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    UniconsLine.star,
                    color: Get.theme.colorScheme.secondary,
                    size: 25,
                  ),
                  Icon(
                    UniconsLine.star,
                    color: Get.theme.colorScheme.secondary,
                    size: 25,
                  ),
                  Icon(
                    UniconsLine.star,
                    color: Get.theme.colorScheme.secondary,
                    size: 40,
                  ),
                  Icon(
                    UniconsLine.star,
                    color: Get.theme.colorScheme.secondary,
                    size: 35,
                  ),
                  Icon(
                    UniconsLine.star,
                    color: Get.theme.colorScheme.secondary,
                    size: 25,
                  ),
                ],
              ),
            ),
            Text(
              "The best we can get.".tr,
              style: Get.textTheme.caption,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
