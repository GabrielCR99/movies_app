import '../../models/movie_detail_model.dart';
import '../../models/movie_model.dart';
import '../../repositories/movies/movies_repository.dart';
import 'movies_service.dart';

class MoviesServiceImpl implements MoviesService {
  final MoviesRepository _moviesRepository;

  const MoviesServiceImpl({required MoviesRepository moviesRepository})
      : _moviesRepository = moviesRepository;

  @override
  Future<List<MovieModel>> getPopularMovies() =>
      _moviesRepository.getPopularMovies();

  @override
  Future<List<MovieModel>> getTopRatedMovies() =>
      _moviesRepository.getTopRatedMovies();

  @override
  Future<MovieDetailModel> getMovieDetail(int id) =>
      _moviesRepository.getMovieDetail(id);

  @override
  Future<List<String>> getMovieImages(int id) =>
      _moviesRepository.getMovieImages(id);

  @override
  Future<void> addOrRemoveFavoriteMovie(String id, MovieModel movie) =>
      _moviesRepository.addOrRemoveFavoriteMovie(id, movie);

  @override
  Future<List<MovieModel>> getFavoriteMovies(String id) =>
      _moviesRepository.getFavoriteMovies(id);
}
