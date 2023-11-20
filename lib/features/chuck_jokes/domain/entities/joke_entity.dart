import 'package:equatable/equatable.dart';

class JokeEntity extends Equatable {
  final List<String> categories;
  final String createdAt;
  final String iconUrl;
  final String id;
  final String updatedAt;
  final String url;
  final String value;

  const JokeEntity({
    required this.categories,
    required this.createdAt,
    required this.iconUrl,
    required this.id,
    required this.updatedAt,
    required this.url,
    required this.value,
  });

  factory JokeEntity.empty() {
    return const JokeEntity(
      categories: [],
      createdAt: '',
      iconUrl: '',
      id: '',
      updatedAt: '',
      url: '',
      value: '',
    );
  }

  @override
  List<Object?> get props => [
        [],
        createdAt,
        iconUrl,
        id,
        updatedAt,
        url,
        value,
      ];
}
