import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../domain.dart';

abstract class JokeByCategoryRepository {
  /// Return a list of categories if the request is successful
  /// or return an exception if the request fails.
  Future<Either<ServerException, List<CategoryEntity>>> getCategories();
}
