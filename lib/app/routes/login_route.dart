import 'package:get/get.dart';

import '../modules/login/login_bindings.dart';
import '../modules/login/login_page.dart';

class LoginRoute {
  const LoginRoute._();

  static final routes = [
    GetPage<LoginPage>(
      name: '/login',
      page: LoginPage.new,
      binding: LoginBindings(),
    ),
  ];
}
