import 'package:get/get.dart';
import 'package:settings_module/settings/settings.controller.dart';

class SettingsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}
