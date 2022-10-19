import 'package:get/get.dart';

import '../../core/mixins/loader_mixin.dart';
import '../../core/mixins/message_mixin.dart';
import '../../models/genre_model.dart';
import '../../models/movie_model.dart';
import '../../services/genres/genres_service.dart';
import '../../services/movies/movies_service.dart';

class MoviesController extends GetxController with LoaderMixin, MessageMixin {
  final GenresService _genresService;
  final MoviesService _moviesService;

  MoviesController({
    required GenresService genresService,
    required MoviesService moviesService,
  })  : _genresService = genresService,
        _moviesService = moviesService;

  final _message = Rxn<MessageModel>();
  final _loading = false.obs;
  final genres = <GenreModel>[].obs;
  final popularMovies = <MovieModel>[].obs;
  final topRatedMovies = <MovieModel>[].obs;
  final genreSelected = Rxn<GenreModel>();

  var _originalPopularMovies = <MovieModel>[];
  var _originalTopRatedMovies = <MovieModel>[];

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    _loading.toggle();
    try {
      final genresData = await _genresService.getGenres();
      genres.assignAll(genresData);

      final popularMoviesData = await _moviesService.getPopularMovies();
      final topRatedMoviesData = await _moviesService.getTopRatedMovies();

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
}
