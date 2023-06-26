class CastModel {
  final String name;
  final String image;
  final String character;

  const CastModel({
    required this.name,
    required this.image,
    required this.character,
  });
  Map<String, dynamic> toMap() => {
        'name': name,
        'image': image,
        'character': character,
      };

  factory CastModel.fromMap(Map<String, dynamic> map) => CastModel(
        name: (map['name'] ?? '') as String,
        image: 'https://image.tmdb.org/t/p/w200/${map['profile_path']}',
        character: (map['character'] ?? '') as String,
      );
}
