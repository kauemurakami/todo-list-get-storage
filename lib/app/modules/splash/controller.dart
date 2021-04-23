import 'package:get/get.dart';
import 'package:mobile/routes/pages.dart';

class SplashController extends GetxController {
  splashF() async => await Future.delayed(
      Duration(seconds: 3), () => Get.toNamed(Routes.HOME));
}
