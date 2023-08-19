import 'package:flutter/material.dart';
import 'package:fly_ui/views/layouts/scaffoldLayout.widget.dart';
import 'package:fly_ui/views/layouts/scaffoldPadding.widget.dart';
import 'package:fly_ui/views/widgets/appBar.widget.dart';
import 'package:get/get.dart';
import 'layouts/landscape.layout.dart';
import 'layouts/portrait.layout.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({
    Key? key,
    this.customSettings,
  }) : super(key: key);

  final List<Widget>? customSettings;
  @override
  Widget build(BuildContext context) {
    return FlyScaffold(
      appBar: context.isLandscape ? null : FlyAppBar(title: 'Settings'.tr),
      child: FlyScaffoldPadding(
        child: context.isLandscape
            ? LandscapeLayout(customSettings: customSettings)
            : PortraitLayout(customSettings: customSettings),
      ),
    );
  }
}
