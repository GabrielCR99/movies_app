import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../../core/rest_client/rest_client.dart';
import '../../models/genre_model.dart';
import 'genres_repository.dart';

class GenresRepositoryImpl implements GenresRepository {
  final RestClient _restClient;

  const GenresRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<List<GenreModel>> getGenres() async {
    try {
      final response = await _restClient.get(
        '/genre/movie/list',
        queryParameters: {
          'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
          'language': 'pt-BR',
        },
      );

      final data = (response.data['genres'] ?? const <GenreModel>[]) as List;

      return data
          .cast<Map<String, dynamic>>()
          .map<GenreModel>(GenreModel.fromJson)
          .toList();
    } on DioError catch (e, s) {
      log('Error: ${e.message}', error: e, stackTrace: s);

      Error.throwWithStackTrace(Exception('Erro ao buscar genres'), s);
    }
  }
}
