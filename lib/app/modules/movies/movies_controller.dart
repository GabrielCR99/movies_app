import 'package:get/get.dart';

import '../../core/mixins/loader_mixin.dart';
import '../../core/mixins/message_mixin.dart';
import '../../models/genre_model.dart';
import '../../services/genres/genres_service.dart';

class MoviesController extends GetxController with LoaderMixin, MessageMixin {
  final GenresService _genresService;

  MoviesController({required GenresService genresService})
      : _genresService = genresService;

  final _message = Rxn<MessageModel>();
  final _loading = false.obs;
  final _genres = <GenreModel>[].obs;

  List<GenreModel> get genres => _genres;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      final genres = await _genresService.getGenres();
      _genres.assignAll(genres);
    } on Exception {
      _message(
        const MessageModel.error(
          title: 'Erro',
          message: 'Erro ao buscar categorias',
        ),
      );
    }
  }
}
