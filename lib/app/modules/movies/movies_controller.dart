import 'package:get/get.dart';

import '../../core/auth/auth_service.dart';
import '../../core/mixins/loader_mixin.dart';
import '../../core/mixins/message_mixin.dart';
import '../../models/genre_model.dart';
import '../../models/movie_model.dart';
import '../../services/genres/genres_service.dart';
import '../../services/movies/movies_service.dart';

class MoviesController extends GetxController with LoaderMixin, MessageMixin {
  final genres = <GenreModel>[].obs;
  final popularMovies = <MovieModel>[].obs;
  final topRatedMovies = <MovieModel>[].obs;
  final genreSelected = Rxn<GenreModel>();
  final _message = Rxn<MessageModel>();
  final _loading = false.obs;
  var _originalPopularMovies = <MovieModel>[];
  var _originalTopRatedMovies = <MovieModel>[];

  final GenresService _genresService;
  final MoviesService _moviesService;
  final AuthService _authService;

  MoviesController({
    required GenresService genresService,
    required MoviesService moviesService,
    required AuthService authService,
  })  : _genresService = genresService,
        _moviesService = moviesService,
        _authService = authService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    await _getMovies();
  }

  Future<void> _getMovies() async {
    _loading.toggle();
    try {
      final genresData = await _genresService.getGenres();
      genres.assignAll(genresData);

      var popularMoviesData = await _moviesService.getPopularMovies();
      var topRatedMoviesData = await _moviesService.getTopRatedMovies();
      final favorites = await getFavoriteMovies();

      popularMoviesData = popularMoviesData
          .map(
            (e) => favorites.containsKey(e.id)
                ? e.copyWith(favorite: true)
                : e.copyWith(favorite: false),
          )
          .toList();

      topRatedMoviesData = topRatedMoviesData
          .map(
            (e) => favorites.containsKey(e.id)
                ? e.copyWith(favorite: true)
                : e.copyWith(favorite: false),
          )
          .toList();

      popularMovies.assignAll(popularMoviesData);
      _originalPopularMovies = popularMoviesData;

      topRatedMovies.assignAll(topRatedMoviesData);
      _originalTopRatedMovies = topRatedMoviesData;
      _loading.toggle();
    } on Exception {
      _loading.toggle();
      _message(
        const MessageModel.error(
          title: 'Erro',
          message: 'Erro ao carregar a página',
        ),
      );
    }
  }

  void filterByName(String title) {
    if (title.isNotEmpty) {
      final newPopularMovies = _originalPopularMovies
          .where(
            (movie) => movie.title.toLowerCase().contains(title.toLowerCase()),
          )
          .toList();

      final newTopRatedMovies = _originalTopRatedMovies
          .where(
            (movie) => movie.title.toLowerCase().contains(title.toLowerCase()),
          )
          .toList();

      popularMovies.assignAll(newPopularMovies);
      topRatedMovies.assignAll(newTopRatedMovies);
    } else {
      popularMovies.assignAll(_originalPopularMovies);
      topRatedMovies.assignAll(_originalTopRatedMovies);
    }
  }

  void filterMoviesByGenres(GenreModel? genre) {
    var genreFilter = genre;

    if (genreFilter?.id == genreSelected.value?.id) {
      genreFilter = null;
    }

    genreSelected.value = genreFilter;

    if (genreFilter != null) {
      final newPopularMovies = _originalPopularMovies
          .where((movie) => movie.genres.contains(genreFilter?.id))
          .toList();

      final newTopRatedMovies = _originalTopRatedMovies
          .where((movie) => movie.genres.contains(genreFilter?.id))
          .toList();

      popularMovies.assignAll(newPopularMovies);
      topRatedMovies.assignAll(newTopRatedMovies);
    } else {
      popularMovies.assignAll(_originalPopularMovies);
      topRatedMovies.assignAll(_originalTopRatedMovies);
    }
  }

  Future<void> favoriteMovie(MovieModel model) async {
    final user = _authService.user;

    if (user != null) {
      final newMovie = model.copyWith(favorite: !model.favorite);
      await _moviesService.addOrRemoveFavoriteMovie(user.uid, newMovie);
      await _getMovies();
    }
  }

  Future<Map<int, MovieModel>> getFavoriteMovies() async {
    final user = _authService.user;

    if (user != null) {
      final favoriteMovies = await _moviesService.getFavoriteMovies(user.uid);

      return {for (final movie in favoriteMovies) movie.id: movie};
    } else {
      return const {};
    }
  }
}
