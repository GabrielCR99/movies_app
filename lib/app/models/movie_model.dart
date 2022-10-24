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

  Map<String, Object> toMap() => {
        'id': id,
        'title': title,
        'poster_path': posterPath,
        'release_date': releaseDate,
        'genre_ids': genres,
        'favorite': favorite,
      };

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      posterPath: 'https://image.tmdb.org/t/p/w200/${map['poster_path']}',
      releaseDate: map['release_date'] ?? '',
      genres: List<int>.from(map['genre_ids']),
      favorite: map['favorite'] ?? false,
    );
  }

  MovieModel copyWith({
    int? id,
    String? title,
    String? posterPath,
    String? releaseDate,
    List<int>? genres,
    bool? favorite,
  }) {
    return MovieModel(
      id: id ?? this.id,
      title: title ?? this.title,
      posterPath: posterPath ?? this.posterPath,
      releaseDate: releaseDate ?? this.releaseDate,
      genres: genres ?? this.genres,
      favorite: favorite ?? this.favorite,
    );
  }
}
