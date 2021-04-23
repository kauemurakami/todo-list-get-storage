import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:mobile/app/modules/home/controller.dart';
import 'package:mobile/app/widgets/custom_tff_glass.dart';
import 'package:mobile/app/widgets/loading.dart';
import 'package:mobile/core/values/colors.dart';
import 'package:mobile/core/values/strings.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AddAnnotationForm extends Container {
  final GlobalKey _formKey = GlobalKey<FormState>();
  final controller = Get.find<HomeController>();
  final bool edit;
  final index;
  AddAnnotationForm({this.edit = false, this.index});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormFieldGlass(
                initialValue: this.controller.title.value,
                action: TextInputAction.next,
                text: title,
                validator: (value) => this.controller.validateTitle(value),
                onChanged: (value) => this.controller.onChangedTitle(value),
                onSaved: (value) => this.controller.onSavedTitle(value),
              ),
              CustomTextFormFieldGlass(
                initialValue: this.controller.description.value,
                maxLines: 4,
                text: description,
                validator: (value) =>
                    this.controller.validateDescription(value),
                onChanged: (value) =>
                    this.controller.onChangedDescription(value),
                onSaved: (value) => this.controller.onSavedDescription(value),
                action: TextInputAction.done,
              ),
              Obx(() => this.controller.load.value
                  ? LoadingWidget()
                  : Container(
                      width: 160.0,
                      padding: const EdgeInsets.only(top: 24.0),
                      child: OutlineButton(
                          hoverColor: neruColor,
                          splashColor: neruColor2,
                          highlightedBorderColor: neruColor2,
                          highlightColor: neruColor,
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                          onPressed: () async {
                            FormState formState = this._formKey.currentState;
                            if (formState.validate()) {
                              formState.save();
                              this.controller.edit.value
                                  ? await this.controller.editAnnotation(index)
                                  : await this.controller.addAnnotation();

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
                                        backgroundColor: Colors.transparent,
                                        textStyle:
                                            TextStyle(color: Colors.white),
                                        message: this.controller.message.value,
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
                                      )));
                            } else {
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
                                      child: CustomSnackBar.info(
                                        icon: Icon(
                                          Icons.sentiment_neutral,
                                          color: this
                                                  .controller
                                                  .appConfigService
                                                  .getTheme()
                                              ? neruColor2
                                              : neruColor,
                                          size: 120,
                                        ),
                                        backgroundColor: Colors.transparent,
                                        textStyle:
                                            TextStyle(color: Colors.white),
                                        message: this.controller.message.value,
                                      )));
                            }
                          },
                          child: Text(
                            this.controller.edit.value ? editT : add,
                            style: TextStyle(color: Colors.white),
                          )),
                    ))
            ],
          ),
        ),
      ),
    );
  }
}
