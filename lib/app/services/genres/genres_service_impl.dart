import '../../models/genre_model.dart';
import '../../repositories/genres/genres_repository.dart';
import 'genres_service.dart';

class GenresServiceImpl implements GenresService {
  final GenresRepository _genresRepository;

  const GenresServiceImpl({required GenresRepository genresRepository})
      : _genresRepository = genresRepository;

  @override
  Future<List<GenreModel>> getGenres() => _genresRepository.getGenres();
}
