import 'home_route.dart';
import 'login_route.dart';
import 'movie_detail.dart';
import 'splash_route.dart';

class AppRoutes {
  static final routes = [
    ...SplashRoute.routes,
    ...LoginRoute.routes,
    ...HomeRoute.routes,
    ...MovieDetail.routes,
  ];

  const AppRoutes._();
}
