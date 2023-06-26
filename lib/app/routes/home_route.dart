import 'package:get/get.dart';

import '../modules/home/home_bindings.dart';
import '../modules/home/home_page.dart';

class HomeRoute {
  static final routes = [
    GetPage<HomePage>(
      name: '/home',
      page: HomePage.new,
      binding: HomeBindings(),
    ),
  ];

  const HomeRoute._();
}
