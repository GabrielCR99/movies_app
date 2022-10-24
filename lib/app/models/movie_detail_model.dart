import 'cast_model.dart';
import 'genre_model.dart';

class MovieDetailModel {
  final String title;
  final double stars;
  final List<GenreModel> genres;
  final DateTime releaseDate;
  final String overview;
  final List<String> productionCompanies;
  final String originalLanguage;
  final List<CastModel> cast;

  const MovieDetailModel({
    required this.title,
    required this.stars,
    required this.genres,
    required this.releaseDate,
    required this.overview,
    required this.productionCompanies,
    required this.originalLanguage,
    required this.cast,
  });

  factory MovieDetailModel.fromMap(Map<String, dynamic> map) {
    return MovieDetailModel(
      title: map['title'] ?? '',
      stars: map['vote_average'] ?? 0.0,
      genres: List<GenreModel>.from(
        map['genres'].cast<Map<String, dynamic>>()?.map(GenreModel.fromJson),
      ),
      releaseDate: DateTime.parse(map['release_date']),
      overview: map['overview'] ?? '',
      productionCompanies: List.from(map['production_companies'] ?? const [])
          .map<String>((e) => e['name'])
          .toList(),
      originalLanguage: map['original_language'] ?? '',
      cast: List<CastModel>.from(
        map['credits']['cast']
                .cast<Map<String, dynamic>>()
                ?.map(CastModel.fromMap) ??
            const [],
      ),
    );
  }
}
