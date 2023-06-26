import 'package:dio/io.dart';

class RestClient extends DioForNative {
  RestClient() {
    options
      ..baseUrl = 'https://api.themoviedb.org/3'
      ..connectTimeout = const Duration(milliseconds: 50000)
      ..receiveTimeout = const Duration(milliseconds: 30000);
  }
}
