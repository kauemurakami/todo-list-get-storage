import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/splash/controller.dart';
import 'package:mobile/core/utils/percent_width_height.dart';
import 'package:mobile/core/values/colors.dart';

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    this.controller.splashF();
    return Scaffold(
        backgroundColor: splashBg,
        body: SafeArea(
            child: Container(
          height: 100.0.hp,
          width: 100.0.wp,
          child: Container(
            height: 50.0.hp,
            width: 100.0.hp,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/splash.gif'))),
          ),
        )));
  }
}
