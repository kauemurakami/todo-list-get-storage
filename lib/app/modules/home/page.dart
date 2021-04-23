import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/home/controller.dart';
import 'package:mobile/app/modules/home/widgets/fab.dart';
import 'package:mobile/app/modules/home/widgets/item_list.dart';
import 'package:mobile/app/modules/home/widgets/switch_theme.dart';
import 'package:mobile/core/theme/text_theme.dart';
import 'package:mobile/core/values/strings.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    annotations,
                    style: titleAnnotations,
                  ),
                  SwitchThemeWidget()
                ],
              ),
            ),
            Expanded(
              flex: 11,
              child: Obx(() =>
                  this.controller.annotations.value.annotations.length <= 0
                      ? Center(
                          child: Text(empty),
                        )
                      : Container(
                          child: Obx(() => ListView.builder(
                              itemCount: this
                                  .controller
                                  .annotations
                                  .value
                                  .annotations
                                  .length,
                              itemBuilder: (_, index) =>
                                  ItemListWidget(index))),
                        )),
            )
          ],
        )),
        floatingActionButton: FabWidget());
  }
}
