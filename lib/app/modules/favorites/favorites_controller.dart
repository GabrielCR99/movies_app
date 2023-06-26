import 'package:get/get.dart';

import '../../core/auth/auth_service.dart';
import '../../core/mixins/loader_mixin.dart';
import '../../models/movie_model.dart';
import '../../services/movies/movies_service.dart';

class FavoritesController extends GetxController with LoaderMixin {
  var movies = <MovieModel>[].obs;
  final AuthService _authService;
  final MoviesService _moviesService;

  final _loading = false.obs;

  FavoritesController({
    required AuthService authService,
    required MoviesService moviesService,
  })  : _authService = authService,
        _moviesService = moviesService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    await _getFavorites();
  }

  Future<void> _getFavorites() async {
    final user = _authService.user;

    if (user != null) {
      _loading.toggle();
      final favorites = await _moviesService.getFavoriteMovies(user.uid);
      _loading.toggle();
      movies.assignAll(favorites);
    }
  }

  Future<void> removeFavorite(MovieModel movie) async {
    final user = _authService.user;

    if (user != null) {
      _loading.toggle();
      await _moviesService.addOrRemoveFavoriteMovie(
        user.uid,
        movie.copyWith(favorite: false),
      );
      _loading.toggle();
      movies.remove(movie);
    }
  }
}
