import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:mobile/app/modules/home/controller.dart';
import 'package:mobile/app/modules/home/widgets/add_post_form.dart';
import 'package:mobile/core/theme/text_theme.dart';
import 'package:mobile/core/values/strings.dart';

class BottomSheetAnnotation extends Container {
  final controller = Get.find<HomeController>();
  final index;
  BottomSheetAnnotation({this.index});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GlassmorphicContainer(
          width: Get.width,
          height: Get.height / 2,
          borderRadius: 8.0,
          blur: 20,
          alignment: Alignment.bottomCenter,
          border: 2,
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
          borderGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFffffff).withOpacity(0.5),
              Colors.black.withOpacity(0.6),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  createAnnotation,
                  style: bsAnnotationStyle,
                ),
              ),
              AddAnnotationForm(
                index: this.index,
              )
            ],
          )),
    );
  }
}
