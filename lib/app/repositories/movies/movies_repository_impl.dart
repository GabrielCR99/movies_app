import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../../core/rest_client/rest_client.dart';
import '../../models/movie_detail_model.dart';
import '../../models/movie_model.dart';
import 'movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final RestClient _restClient;

  const MoviesRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    try {
      final response = await _restClient.get(
        '/movie/popular',
        queryParameters: {
          'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
          'language': 'pt-br',
          'page': '1',
        },
      );

      final movies = (response.data['results'] ?? const <MovieModel>[]) as List;

      return movies
          .cast<Map<String, dynamic>>()
          .map<MovieModel>(MovieModel.fromMap)
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar filmes populares', error: e, stackTrace: s);

      Error.throwWithStackTrace(
        Exception('Erro ao buscar filmes populares'),
        s,
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    try {
      final response = await _restClient.get(
        '/movie/top_rated',
        queryParameters: {
          'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
          'language': 'pt-br',
          'page': '1',
        },
      );

      final movies = (response.data['results'] ?? const <MovieModel>[]) as List;

      return movies
          .cast<Map<String, dynamic>>()
          .map<MovieModel>(MovieModel.fromMap)
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar filmes populares', error: e, stackTrace: s);

      Error.throwWithStackTrace(
        Exception('Erro ao buscar filmes populares'),
        s,
      );
    }
  }

  @override
  Future<MovieDetailModel> getMovieDetail(int id) async {
    try {
      final response = await _restClient.get(
        '/movie/$id',
        queryParameters: {
          'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
          'language': 'pt-br',
          'append_to_response': 'credits,images',
          'include_image_language': 'en,pt-br',
        },
      );

      return MovieDetailModel.fromMap(response.data);
    } on DioError catch (e, s) {
      log('Erro ao buscar detalhes do filme', error: e, stackTrace: s);

      Error.throwWithStackTrace(
        Exception('Erro ao buscar detalhes do filme'),
        s,
      );
    }
  }

  @override
  Future<List<String>> getMovieImages(int id) async {
    try {
      final response = await _restClient.get(
        '/movie/$id/images?api_key=${FirebaseRemoteConfig.instance.getString('api_token')}',
        queryParameters: {
          'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
          'language': 'pt-br',
          'include_image_language': 'en,pt-br',
          'append_to_response': 'images',
        },
      );

      final images = (response.data['posters'] ?? const <String>[]) as List;

      return images
          .cast<Map<String, dynamic>>()
          .map<String>(
            (image) => 'https://image.tmdb.org/t/p/w200${image['file_path']}',
          )
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar imagens do filme', error: e, stackTrace: s);

      Error.throwWithStackTrace(
        Exception('Erro ao buscar imagens do filme'),
        s,
      );
    }
  }

  @override
  Future<void> addOrRemoveFavoriteMovie(String id, MovieModel movie) async {
    try {
      final favoriteCollection = FirebaseFirestore.instance
          .collection('favorites')
          .doc(id)
          .collection('movies');

      if (movie.favorite) {
        await favoriteCollection.add(movie.toMap());
      } else {
        final favoriteData = await favoriteCollection
            .where('id', isEqualTo: movie.id)
            .limit(1)
            .get();

        await favoriteData.docs.first.reference.delete();
      }
    } catch (e, s) {
      log('Erro ao favoritar filme', error: e, stackTrace: s);

      rethrow;
    }
  }

  @override
  Future<List<MovieModel>> getFavoriteMovies(String id) async {
    final favoriteMovies = await FirebaseFirestore.instance
        .collection('favorites')
        .doc(id)
        .collection('movies')
        .get();

    final movies = <MovieModel>[];

    for (final movie in favoriteMovies.docs) {
      movies.add(MovieModel.fromMap(movie.data()));
    }

    return movies;
  }
}
