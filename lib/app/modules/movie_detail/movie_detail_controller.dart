import 'package:get/get.dart';

import '../../core/mixins/loader_mixin.dart';
import '../../core/mixins/message_mixin.dart';
import '../../models/movie_detail_model.dart';
import '../../services/movies/movies_service.dart';

class MovieDetailController extends GetxController
    with LoaderMixin, MessageMixin {
  final MoviesService _moviesService;

  MovieDetailController({required MoviesService moviesService})
      : _moviesService = moviesService;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  var movie = Rxn<MovieDetailModel>();
  final _movieImages = <String>[].obs;

  List<String> get movieImages => _movieImages;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    final movieId = Get.arguments as int;

    try {
      _loading.toggle();
      final movieDetailData = await _moviesService.getMovieDetail(movieId);
      final movieImages = await _moviesService.getMovieImages(movieId);
      _movieImages.addAll(movieImages);
      movie.value = movieDetailData;
      _loading.toggle();
    } on Exception {
      _loading.toggle();
      _message(
        const MessageModel.error(
          title: 'Erro',
          message: 'Erro ao buscar detalhes do filme',
        ),
      );
    }
  }
}
