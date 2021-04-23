import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:mobile/core/values/colors.dart';
import 'package:mobile/core/values/strings.dart';
import '../controller.dart';
import 'package:mobile/core/utils/percent_width_height.dart';

class SwitchThemeWidget extends Container {
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4.0.hp,
      margin: EdgeInsets.only(top: 8.0),
      child: LiteRollingSwitch(
        textOff: dark,
        textOn: light,
        onChanged: (b) => this.controller.appConfigService.changeTheme(b),
        colorOn: neruColor2,
        colorOff: neruColor,
        iconOn: Icons.brightness_2,
        iconOff: Icons.brightness_6_outlined,
        value: this.controller.appConfigService.getTheme(),
      ),
    );
  }
}
