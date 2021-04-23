import 'package:get/get.dart';
import 'package:mobile/app/modules/home/binding.dart';
import 'package:mobile/app/modules/home/page.dart';
import 'package:mobile/app/modules/splash/page.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.HOME, page: () => HomePage(), binding: HomeBinding()),
    GetPage(name: Routes.SPLASH, page: () => SplashPage())
  ];
}
