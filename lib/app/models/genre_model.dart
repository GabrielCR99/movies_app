class GenreModel {
  final int id;
  final String name;

  const GenreModel({required this.id, required this.name});

  factory GenreModel.fromJson(Map<String, dynamic> json) =>
      GenreModel(id: json['id'] as int, name: json['name'] as String);
}
