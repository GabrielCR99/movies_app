import 'package:get/get.dart';

import '../modules/movie_detail/movie_detail_bindings.dart';
import '../modules/movie_detail/movie_detail_page.dart';

class MovieDetail {
  static final routes = [
    GetPage<MovieDetailPage>(
      name: '/movie-detail',
      page: () => const MovieDetailPage(),
      binding: MovieDetailBindings(),
    ),
  ];

  const MovieDetail._();
}
