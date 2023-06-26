import 'package:get/get.dart';

import '../modules/login/login_bindings.dart';
import '../modules/login/login_page.dart';

class LoginRoute {
  static final routes = [
    GetPage<LoginPage>(
      name: '/login',
      page: LoginPage.new,
      binding: LoginBindings(),
    ),
  ];

  const LoginRoute._();
}
