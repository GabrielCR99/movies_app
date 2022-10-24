import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/ui/movies_app_icons.dart';
import '../../core/ui/theme_extension.dart';
import '../favorites/favorites_bindings.dart';
import '../favorites/favorites_page.dart';
import '../movies/movies_bindings.dart';
import '../movies/movies_page.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Filmes'),
            BottomNavigationBarItem(
              icon: Icon(MoviesAppIcons.emptyHeart),
              label: 'Favoritos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout_outlined),
              label: 'Sair',
            ),
          ],
          onTap: controller.goToPage,
          selectedItemColor: context.redTheme,
          unselectedItemColor: Colors.grey,
          currentIndex: controller.pageIndex,
        ),
      ),
      body: Navigator(
        initialRoute: '/movies',
        key: Get.nestedKey(HomeController.navigatorKey),
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }

  Route<dynamic>? _onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/movies') {
      return GetPageRoute(
        settings: settings,
        page: () => const MoviesPage(),
        binding: MoviesBindings(),
      );
    }

    if (settings.name == '/favorites') {
      return GetPageRoute(
        settings: settings,
        page: () => const FavoritesPage(),
        binding: FavoritesBindings(),
      );
    }

    return null;
  }
}
