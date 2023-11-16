import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:chuck_jokes/features/chuck_jokes/domain/domain.dart';

class MockJokeByCategoryRepository extends Mock
    implements JokeByCategoryRepository {}

void main() {
  late MockJokeByCategoryRepository mockJokeByCategoryRepository;

  setUp(() {
    mockJokeByCategoryRepository = MockJokeByCategoryRepository();
  });

  test('Should return a List of Category if request is successful.', () async {
    const mockCategory = CategoryEntity(category: 'dev');
    const mockListOfCategory = [mockCategory];

    when(() => mockJokeByCategoryRepository.getCategories())
        .thenAnswer((_) async => const Right(mockListOfCategory));

    final result = await mockJokeByCategoryRepository.getCategories();

    expect(result, const Right(mockListOfCategory));
  });
}
