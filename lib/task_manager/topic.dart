// topic.dart
class Topic {
  final String id;
  final String name;
  double rating;
  final List<String> descriptions;

  Topic({
    required this.id,
    required this.name,
    this.rating = 0.1,
    required this.descriptions,
  }) : assert(descriptions.length == 3, 'Need exactly 3 descriptions');

  String get activeDescription {
    if (rating <= 3.3) return descriptions[0];
    if (rating <= 6.6) return descriptions[1];
    return descriptions[2];
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'rating': rating,
    'descriptions': descriptions,
  };

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
    id: json['id'],
    name: json['name'],
    rating: (json['rating'] as num).toDouble(),
    descriptions: List<String>.from(json['descriptions']),
  );
}
