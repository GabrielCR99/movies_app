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
}
