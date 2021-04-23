import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:mobile/app/modules/home/controller.dart';
import 'package:mobile/core/theme/text_theme.dart';
import 'package:mobile/core/values/colors.dart';
import 'package:mobile/core/values/strings.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ItemListWidget extends Container {
  final controller = Get.find<HomeController>();
  final index;
  ItemListWidget(this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: this.controller.appConfigService.getTheme()
                      ? neruColor2
                      : neruColor),
              left: BorderSide(
                  color: this.controller.appConfigService.getTheme()
                      ? neruColor2
                      : neruColor))),
      margin: EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
      padding: EdgeInsets.only(
        left: 8.0,
        right: 8.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(this.controller.annotations.value.annotations[index].value.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.w700)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 11,
                child: Text(
                  this
                      .controller
                      .annotations
                      .value
                      .annotations[index]
                      .value
                      .description,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          this.controller.removeAnotation(index);
                          showTopSnackBar(
                              context,
                              GlassmorphicContainer(
                                  width: Get.width - 100.0,
                                  blur: 20,
                                  height: 80.0,
                                  borderRadius: 12.0,
                                  borderGradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(0xFFffffff).withOpacity(0.5),
                                      Colors.black.withOpacity(0.6),
                                    ],
                                  ),
                                  linearGradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFFffffff).withOpacity(0.1),
                                        Color(0xFFFFFFFF).withOpacity(0.05),
                                      ],
                                      stops: [
                                        0.1,
                                        1,
                                      ]),
                                  border: 0,
                                  child: CustomSnackBar.success(
                                    icon: Icon(
                                      Icons.sentiment_very_satisfied,
                                      color: this
                                              .controller
                                              .appConfigService
                                              .getTheme()
                                          ? neruColor2
                                          : neruColor,
                                      size: 120,
                                    ),
                                    backgroundColor: Colors.transparent,
                                    textStyle: TextStyle(color: Colors.white),
                                    message: removeSuccess,
                                  )));
                        }),
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: this.controller.appConfigService.getTheme()
                            ? neruColor2
                            : neruColor,
                      ),
                      onPressed: () => this.controller.openEdit(index),
                    ),
                    Obx(() => IconButton(
                        icon: Icon(
                          Icons.check,
                          color: this
                                  .controller
                                  .annotations
                                  .value
                                  .annotations[index]
                                  .value
                                  .check
                              ? Colors.green
                              : Colors.grey,
                          size: 32.0,
                        ),
                        onPressed: () async =>
                            await this.controller.checkAnnotation(index))),
                  ],
                ),
              ),
            ],
          ),
          Text(
            createdAt +
                this.controller.annotations.value.annotations[index].value.date,
            style: createdAtText,
          ),
        ],
      ),
    );
  }
}
