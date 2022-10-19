import './movies_service.dart';
import '../../models/movie_model.dart';
import '../../repositories/movies/movies_repository.dart';

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
}
