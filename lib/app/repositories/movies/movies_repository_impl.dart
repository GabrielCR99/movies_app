import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import './movies_repository.dart';
import '../../core/rest_client/rest_client.dart';
import '../../models/movie_model.dart';

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
}
