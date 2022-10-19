import 'package:get/get.dart';

import '../modules/home/home_bindings.dart';
import '../modules/home/home_page.dart';

class HomeRoute {
  const HomeRoute._();

  static final routes = [
    GetPage(
      name: '/home',
      page: HomePage.new,
      binding: HomeBindings(),
    ),
  ];
}
