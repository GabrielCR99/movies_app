import '../../models/movie_detail_model.dart';
import '../../models/movie_model.dart';

abstract class MoviesRepository {
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailModel> getMovieDetail(int id);
  Future<List<String>> getMovieImages(int id);
  Future<void> addOrRemoveFavoriteMovie(String id, MovieModel movie);
  Future<List<MovieModel>> getFavoriteMovies(String id);
}
