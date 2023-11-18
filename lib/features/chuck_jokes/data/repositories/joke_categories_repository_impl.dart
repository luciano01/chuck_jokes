import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';
import '../data.dart';

class JokeCategoriesRepositoryImpl implements JokeCategoriesRepository {
  final JokeCategoriesRemoteDataSource _jokeCategoriesRemoteDataSource;
  final NetworkCheck _networkCheck;

  JokeCategoriesRepositoryImpl(
    this._jokeCategoriesRemoteDataSource,
    this._networkCheck,
  );

  @override
  Future<Either<ServerException, List<CategoryEntity>>> getCategories() async {
    if (await _networkCheck.hasConnection) {
      try {
        final listOfCategories =
            await _jokeCategoriesRemoteDataSource.getCategories();
        return Right(listOfCategories);
      } catch (e) {
        return Left(ServerException());
      }
    } else {
      return Left(ServerException());
    }
  }
}
