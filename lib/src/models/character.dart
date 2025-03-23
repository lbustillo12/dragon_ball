class Character {
  final int id;
  final String name;
  final String race;
  final String image;
  final String gender;
  final String affiliation;
  final String description;
  final List<Transformation>? transformations;

  Character({
    required this.id,
    required this.name,
    required this.race,
    required this.image,
    required this.gender,
    required this.affiliation,
    required this.description,
    this.transformations,
  });

  // Método para convertir un JSON en un objeto Character
  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      race: json['race'],
      image: json['image'],
      gender: json['gender'],
      affiliation: json['affiliation'],
      description: json['description'],
      transformations: json['transformations'] != null
          ? (json['transformations'] as List)
              .map((t) => Transformation.fromJson(t))
              .toList()
          : null,
    );
  }

  // Método para convertir un objeto Character en un JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'race': race,
      'image': image,
      'gender': gender,
      'affiliation': affiliation,
      'description': description,
      'transformations': transformations?.map((t) => t.toJson()).toList(),
    };
  }
}

class Transformation {
  final int id;
  final String name;
  final String image;

  Transformation({
    required this.id,
    required this.name,
    required this.image,
  });

  // Método para convertir un JSON en un objeto Transformation
  factory Transformation.fromJson(Map<String, dynamic> json) {
    return Transformation(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }

  // Método para convertir un objeto Transformation en un JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }
}
