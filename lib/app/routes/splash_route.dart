import 'package:get/get.dart';

import '../modules/splash/splash_page.dart';

class SplashRoute {
  static final routes = [
    GetPage<SplashPage>(name: '/', page: () => const SplashPage()),
  ];

  const SplashRoute._();
}
