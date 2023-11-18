import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../domain.dart';

abstract class JokeCategoriesUsecase {
  /// Return a list of categories if the request is successful
  /// or return an exception if the request fails.
  Future<Either<ServerException, List<CategoryEntity>>> getCategories();
}

/// Implements the JokeCategoriesUsecase.
class JokeCategoriesUsecaseImpl implements JokeCategoriesUsecase {
  final JokeCategoriesRepository _jokeCategoriesRepository;

  JokeCategoriesUsecaseImpl(this._jokeCategoriesRepository);

  @override
  Future<Either<ServerException, List<CategoryEntity>>> getCategories() async {
    return await _jokeCategoriesRepository.getCategories();
  }
}
