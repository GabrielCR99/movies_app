class MovieModel {
  final int id;
  final String title;
  final String posterPath;
  final String releaseDate;
  final List<int> genres;
  final bool favorite;

  const MovieModel({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.releaseDate,
    required this.genres,
    required this.favorite,
  });

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'title': title,
        'poster_path': posterPath,
        'release_date': releaseDate,
        'genre_ids': genres,
        'favorite': favorite,
      };

  factory MovieModel.fromMap(Map<String, dynamic> map) => MovieModel(
        id: (map['id'] ?? 0) as int,
        title: (map['title'] ?? '') as String,
        posterPath: 'https://image.tmdb.org/t/p/w200/${map['poster_path']}',
        releaseDate: (map['release_date'] ?? '1900-01-01') as String,
        genres: List<int>.from((map['genre_ids'] ?? const <int>[]) as List),
        favorite: (map['favorite'] ?? false) as bool,
      );

  MovieModel copyWith({
    int? id,
    String? title,
    String? posterPath,
    String? releaseDate,
    List<int>? genres,
    bool? favorite,
  }) =>
      MovieModel(
        id: id ?? this.id,
        title: title ?? this.title,
        posterPath: posterPath ?? this.posterPath,
        releaseDate: releaseDate ?? this.releaseDate,
        genres: genres ?? this.genres,
        favorite: favorite ?? this.favorite,
      );
}
