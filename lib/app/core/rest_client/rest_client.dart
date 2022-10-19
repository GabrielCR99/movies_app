import 'package:dio/native_imp.dart';

class RestClient extends DioForNative {
  RestClient() {
    options
      ..baseUrl = 'https://api.themoviedb.org/3'
      ..connectTimeout = 50000
      ..receiveTimeout = 30000;
  }
}
