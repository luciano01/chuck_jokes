import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String category;

  const CategoryEntity({
    required this.category,
  });

  @override
  List<Object?> get props => [
        category,
      ];
}
