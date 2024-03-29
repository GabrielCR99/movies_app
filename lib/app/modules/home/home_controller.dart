import 'package:get/get.dart';

import '../../services/login/login_service.dart';

class HomeController extends GetxController {
  static const navigatorKey = 1;
  static const indexPageExit = 2;
  final _pages = ['/movies', '/favorites'];
  final _pageIndex = 0.obs;

  final LoginService _service;

  HomeController({required LoginService service}) : _service = service;

  int get pageIndex => _pageIndex.value;

  void goToPage(int page) {
    _pageIndex(page);
    if (page == indexPageExit) {
      _service.logout();
    } else {
      Get.offNamed<void>(_pages[page], id: navigatorKey);
    }
  }
}
