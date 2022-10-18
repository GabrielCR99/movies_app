import 'login_route.dart';
import 'splash_route.dart';

class AppRoutes {
  const AppRoutes._();

  static final routes = [
    ...SplashRoute.routes,
    ...LoginRoute.routes,
  ];
}
