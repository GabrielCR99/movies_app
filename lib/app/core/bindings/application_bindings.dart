import 'package:get/get.dart';

import '../../repositories/login/login_repository.dart';
import '../../repositories/login/login_repository_impl.dart';
import '../../services/login/login_service.dart';
import '../../services/login/login_service_impl.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<LoginRepository>(LoginRepositoryImpl.new, fenix: true)
      ..lazyPut<LoginService>(() => LoginServiceImpl(repository: Get.find()));
  }
}
