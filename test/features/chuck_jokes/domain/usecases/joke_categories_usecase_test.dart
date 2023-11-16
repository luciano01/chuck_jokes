import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:chuck_jokes/features/chuck_jokes/domain/domain.dart';

class MockJokeCategoriesRepository extends Mock
    implements JokeCategoriesRepository {}

void main() {
  late MockJokeCategoriesRepository mockJokeCategoriesRepository;
  late JokeCategoriesUsecaseImpl jokeCategoriesUsecaseImpl;

  setUp(() {
    mockJokeCategoriesRepository = MockJokeCategoriesRepository();
    jokeCategoriesUsecaseImpl = JokeCategoriesUsecaseImpl(
      mockJokeCategoriesRepository,
    );
  });

  test(
      'Should return a List of Categories from JokeCategoriesRepository when request is successful.',
      () async {
    const mockCategory = CategoryEntity(category: 'dev');
    const mockListOfCategory = [mockCategory];

    when(() => mockJokeCategoriesRepository.getCategories())
        .thenAnswer((_) async => const Right(mockListOfCategory));

    final result = await jokeCategoriesUsecaseImpl.getCategories();

    expect(result, const Right(mockListOfCategory));
  });
}
