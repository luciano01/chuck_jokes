import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../domain.dart';

abstract class JokeByCategoryUsecase {
  /// Return a Joke by Category if the request is successful
  /// or return an exception if the request fails.
  Future<Either<ServerException, JokeEntity>> getJokeByCategory({
    required String category,
  });
}

/// Implements the JokeByCategoryUsecase.
class JokeByCategoryUsecaseImpl implements JokeByCategoryUsecase {
  final JokeByCategoryRepository _jokeByCategoryRepository;

  JokeByCategoryUsecaseImpl(this._jokeByCategoryRepository);

  @override
  Future<Either<ServerException, JokeEntity>> getJokeByCategory({
    required String category,
  }) async {
    return await _jokeByCategoryRepository.getJokeByCategory(
        category: category);
  }
}
