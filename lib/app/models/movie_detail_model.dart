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
      title: (map['title'] ?? '') as String,
      stars: (map['vote_average'] ?? 0.0) as double,
      genres: List<GenreModel>.of(
        (map['genres'] as List).map<GenreModel>(
          (x) => GenreModel.fromJson(x as Map<String, dynamic>),
        ),
      ),
      releaseDate: DateTime.parse((map['release_date'] ?? '') as String),
      overview: (map['overview'] ?? '') as String,
      productionCompanies:
          List<Map<String, dynamic>>.from(map['production_companies'] as List)
              .map<String>((e) => e['name'] as String)
              .toList(),
      originalLanguage: (map['original_language'] ?? '') as String,
      cast: List<CastModel>.from(
        (map['credits']['cast'] as List? ?? const <CastModel>[])
            .cast<Map<String, dynamic>>()
            .map(CastModel.fromMap),
      ),
    );
  }
}
