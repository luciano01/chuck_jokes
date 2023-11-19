import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../domain.dart';

abstract class JokeByCategoryRepository {
  /// Return a Joke by Category if the request is successful
  /// or return an exception if the request fails.
  Future<Either<ServerException, JokeEntity>> getJokeByCategory({
    required String category,
  });
}
