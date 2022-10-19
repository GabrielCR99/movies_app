import 'package:get/get.dart';

import '../../repositories/genres/genres_repository.dart';
import '../../repositories/genres/genres_repository_impl.dart';
import '../../services/genres/genres_service.dart';
import '../../services/genres/genres_service_impl.dart';
import 'movies_controller.dart';

class MoviesBindings implements Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<GenresRepository>(
        () => GenresRepositoryImpl(restClient: Get.find()),
      )
      ..lazyPut<GenresService>(
        () => GenresServiceImpl(genresRepository: Get.find()),
      )
      ..lazyPut(() => MoviesController(genresService: Get.find()));
  }
}
