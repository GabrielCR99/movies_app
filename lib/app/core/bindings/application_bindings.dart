import 'package:get/get.dart';

import '../../repositories/login/login_repository.dart';
import '../../repositories/login/login_repository_impl.dart';
import '../../repositories/movies/movies_repository.dart';
import '../../repositories/movies/movies_repository_impl.dart';
import '../../services/login/login_service.dart';
import '../../services/login/login_service_impl.dart';
import '../../services/movies/movies_service.dart';
import '../../services/movies/movies_service_impl.dart';
import '../auth/auth_service.dart';
import '../rest_client/rest_client.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(RestClient.new, fenix: true)
      ..lazyPut<LoginRepository>(LoginRepositoryImpl.new, fenix: true)
      ..lazyPut<LoginService>(
        () => LoginServiceImpl(repository: Get.find()),
        fenix: true,
      )
      ..lazyPut<MoviesRepository>(
        () => MoviesRepositoryImpl(restClient: Get.find()),
      )
      ..lazyPut<MoviesService>(
        () => MoviesServiceImpl(moviesRepository: Get.find()),
      )
      ..put(AuthService()).init();
  }
}
