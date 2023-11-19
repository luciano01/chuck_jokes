import '../../domain/domain.dart';

class JokeModel extends JokeEntity {
  const JokeModel({
    required List<String> categories,
    required String createdAt,
    required String iconUrl,
    required String id,
    required String updatedAt,
    required String url,
    required String value,
  }) : super(
          categories: categories,
          createdAt: createdAt,
          iconUrl: iconUrl,
          id: id,
          updatedAt: updatedAt,
          url: url,
          value: value,
        );

  factory JokeModel.fromJson(Map<String, dynamic> json) {
    return JokeModel(
      categories: List<String>.from(json['categories'] ?? []),
      createdAt: json['created_at'] ?? '',
      iconUrl: json['icon_url'] ?? '',
      id: json['id'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      url: json['url'] ?? '',
      value: json['value'] ?? '',
    );
  }
}
