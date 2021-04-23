import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobile/app/data/services/app_config/service.dart';
import 'package:mobile/app/modules/splash/binding.dart';
import 'package:mobile/app/modules/splash/page.dart';
import 'package:mobile/routes/pages.dart';

void main() async {
  await GetStorage.init();
  await Get.putAsync(() => AppConfigService().init());
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.SPLASH,
    defaultTransition: Transition.fade,
    initialBinding: SplashBinding(),
    getPages: AppPages.pages,
    home: SplashPage(),
  ));
}
