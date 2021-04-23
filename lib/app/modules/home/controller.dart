import 'dart:convert';

import 'package:get/get.dart';
import 'package:mobile/app/data/model/annotation.dart';
import 'package:mobile/app/data/services/app_config/service.dart';
import 'package:mobile/app/modules/home/widgets/bs_annotation.dart';
import 'package:mobile/core/values/keys.dart';
import 'package:mobile/core/values/strings.dart';

class HomeController extends GetxController {
  AppConfigService appConfigService;
  Rx<Annotations> annotations = Annotations().obs;
  final message = ''.obs;
  final title = ''.obs;
  final description = ''.obs;
  final edit = false.obs;
  final load = false.obs;
  @override
  void onInit() {
    this.appConfigService = Get.find<AppConfigService>();
    this.getAnnotations();
    super.onInit();
  }

  RxList<Rx<Annotation>> annList(res) =>
      RxList<Rx<Annotation>>.from(res.map((x) => Annotation.fromJson(x).obs));

  getAnnotations() async {
    Map ans = this.appConfigService.box.read(ANNOTATIONS);
    if (ans == null) {
      this.annotations.value.annotations = RxList<Rx<Annotation>>();
    } else {
      this.annotations.value.annotations = annList(ans[ANNOTATIONS]);
    }
  }

  removeAnotation(index) async {
    this.annotations.value.annotations.removeAt(index);
    Get.forceAppUpdate();
    await this.appConfigService.box.write(ANNOTATIONS, this.annotations);
  }

  openEdit(index) {
    print(index.toString());
    this.edit.value = true;
    this.title.value = this.annotations.value.annotations[index].value.title;
    this.description.value =
        this.annotations.value.annotations[index].value.description;
    Get.bottomSheet(BottomSheetAnnotation(
      index: index,
    ));
  }

  openAdd() {
    this.title.value = '';
    this.description.value = '';
    this.edit.value = false;
    Get.bottomSheet(BottomSheetAnnotation());
  }

  editAnnotation(index) async {
    this.annotations.value.annotations[index].value.description =
        this.description.value;
    this.annotations.value.annotations[index].value.title = this.title.value;
    Get.forceAppUpdate();
    await this.appConfigService.box.write(ANNOTATIONS, this.annotations);
    this.message.value = edited;
    this.edit.value = false;
    Get.back();
  }

  checkAnnotation(index) async {
    this.annotations.value.annotations[index].value.check =
        !this.annotations.value.annotations[index].value.check;
    Get.forceAppUpdate();
    await this.appConfigService.box.write(ANNOTATIONS, this.annotations);
  }

  RxList<Rx<Annotation>> a = RxList<Rx<Annotation>>();
  addAnnotation() async {
    final now = DateTime.now();
    if (this.title.value == '' || this.description.value == '') {
    } else {
      this.message.value = successInsert;
      a.add(Annotation(
              check: false,
              date:
                  '${now.day}/${now.month}/${now.year} ${now.hour}:${now.minute}',
              description: this.description.value,
              title: this.title.value)
          .obs);
    }
    if (this.annotations.value.annotations.length == null) {
      this.annotations.value.annotations = RxList<Rx<Annotation>>();
    } else {
      this.annotations.value.annotations.insert(0, a.last);
      Get.back();
    }
    await this.appConfigService.box.write(ANNOTATIONS, this.annotations);
    this.title.value = '';
    this.description.value = '';
  }

  onSavedTitle(v) => this.title.value = v;
  validateTitle(v) {
    if (v.length <= 0) {
      this.message.value = verifyItems;
      return insertTitle;
    } else
      return null;
  }

  onChangedTitle(v) => this.title.value = v;

  onSavedDescription(v) => this.description.value = v;
  validateDescription(v) {
    if (v.length <= 0) {
      this.message.value = verifyItems;
      return insertDescription;
    } else
      return null;
  }

  onChangedDescription(v) => this.description.value = v;
}
