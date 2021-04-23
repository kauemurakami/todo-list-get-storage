import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/home/controller.dart';
import 'package:mobile/app/modules/home/widgets/bs_annotation.dart';
import 'package:mobile/core/values/colors.dart';

class FabWidget extends Container {
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: this.controller.appConfigService.getTheme()
            ? neruColor2
            : neruColor,
        onPressed: () => this.controller.openAdd());
  }
}
