import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String category;

  const CategoryEntity({
    required this.category,
  });

  factory CategoryEntity.empty() {
    return const CategoryEntity(
      category: 'animal',
    );
  }

  @override
  List<Object?> get props => [
        category,
      ];
}
