import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';
import '../data.dart';

class JokeByCategoryRepositoryImpl implements JokeByCategoryRepository {
  final JokeByCategoryRemoteDataSource _jokeByCategoryRemoteDataSource;
  final NetworkCheck _networkCheck;

  JokeByCategoryRepositoryImpl(
    this._jokeByCategoryRemoteDataSource,
    this._networkCheck,
  );

  @override
  Future<Either<ServerException, JokeEntity>> getJokeByCategory({
    required String category,
  }) async {
    if (await _networkCheck.hasConnection) {
      try {
        final jokeByCategory = await _jokeByCategoryRemoteDataSource
            .getJokeByCategory(category: category);
        return Right(jokeByCategory);
      } on ServerException {
        return Left(ServerException());
      }
    } else {
      return Left(ServerException());
    }
  }
}
